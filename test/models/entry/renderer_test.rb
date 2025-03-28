require "test_helper"

class Entry::RendererTest < ActiveSupport::TestCase
  test "sanitizes content" do
    content = "<script>alert('XSS')</script>"
    post = Post.new(body: content)
    entry = Entry.new(entryable: post)

    output = Entry::Renderer.new(entry).render

    assert_no_match(/<script>/, output)
  end

  test "renders text fragments" do
    content = "Hello, world!"
    post = Post.new(body: content)
    entry = Entry.new(entryable: post)

    output = Entry::Renderer.new(entry).render

    assert_equal "Hello, world!", output
  end

  test "renders handle fragments" do
    user1 = create(:user)
    user2 = create(:user, username: "john.doe")
    entry = create(:entry, entryable: create(:post, body: "Hello, @john.doe!"), owner: user1)
    create(:follow, follower: user1, followee: user2)
    create(:mention, entry: entry, mentioner: user1, mentionee: user2)

    output = Entry::Renderer.new(entry).render

    assert_match(/<a/, output)
    assert_match(/href="\/#{user2.username}/, output)
  end

  test "renders mixed fragments" do
    user1 = create(:user)
    user2 = create(:user, username: "john.doe")
    entry = create(:entry, entryable: create(:post, body: "Hello, @john.doe!"), owner: user1)
    create(:follow, follower: user1, followee: user2)
    create(:mention, entry: entry, mentioner: user1, mentionee: user2)

    output = Entry::Renderer.new(entry).render

    assert_match(/Hello,/, output)
    assert_match(/<a/, output)
    assert_match(/href="\/#{user2.username}/, output)
  end

  test "does not handle with no mentions" do
    user = create(:user)
    entry = create(:entry, entryable: create(:post, body: "Hello, @john.doe!"), owner: user)

    output = Entry::Renderer.new(entry).render

    assert_no_match(/<a/, output)
  end
end
