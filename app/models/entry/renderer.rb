class Entry::Renderer
  HANDLE_PATTERN = /@[a-zA-Z0-9_]([a-zA-Z0-9_]|\.[a-zA-Z0-9_])+/

  FRAGMENT_TYPE = {
    text: 0,
    handle: 1
  }.freeze

  class Fragment
    attr_reader :type, :value

    def initialize(type, value)
      raise ArgumentError, "Invalid fragment type" unless FRAGMENT_TYPE.values.include?(type)
      raise ArgumentError, "Invalid fragment value" unless value.present?

      @type = type
      @value = value
    end
  end

  def initialize(entry)
    @entry = entry
  end

  def render
    parse_fragments.map { render_fragment(it) }.join
  end

  private
  def parse_fragments
    fragments = []
    content = @entry.content

    while content.present?
      match = HANDLE_PATTERN.match(content)
      if match.present?
        fragments << Fragment.new(FRAGMENT_TYPE[:text], match.pre_match) if match.pre_match.present?
        fragments << Fragment.new(FRAGMENT_TYPE[:handle], match[0])
        content = match.post_match
      else
        fragments << Fragment.new(FRAGMENT_TYPE[:text], content)
        content = nil
      end
    end

    fragments
  end

  def render_fragment(fragment)
    case fragment.type
    when FRAGMENT_TYPE[:text]
      ERB::Util.html_escape(fragment.value)
    when FRAGMENT_TYPE[:handle]
      render_handle(fragment.value)
    end
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
