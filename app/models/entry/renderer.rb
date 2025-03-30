class Entry::Renderer
  def initialize(entry)
    @entry = entry
  end

  def render
    fragments = Entry::ContentParser.new(@entry).parse
    fragments.map { render_fragment(it) }.join
  end

  private
  def render_fragment(fragment)
    case fragment.type
    when Entry::Fragment::FRAGMENT_TYPE[:text]
      render_text(fragment.value)
    when Entry::Fragment::FRAGMENT_TYPE[:handle]
      render_handle(fragment.value)
    end
  end

  def render_text(value)
    ERB::Util.html_escape(value)
  end

  def render_handle(value)
    mention = mention_for(handle: Handle.new(value).to_s)
    return value unless mention.present?

    ApplicationController.render(Mentions::Mention::Component.new(mention:), layout: false)
  end

  def mentions_map
    @_mentions_map ||= @entry.mentions.includes(:mentionee).index_by { |mention| mention.mentionee.handle }
  end

  def mention_for(handle:)
    mentions_map[handle]
  end
end
