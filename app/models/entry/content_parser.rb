class Entry::ContentParser
  HANDLE_PATTERN = /@[a-zA-Z0-9_]([a-zA-Z0-9_]|\.[a-zA-Z0-9_])+/

  def initialize(entry)
    @entry = entry
  end

  def parse
    fragments = []
    content = @entry.content

    while content.present?
      match = HANDLE_PATTERN.match(content)
      if match.present?
        fragments << Entry::Fragment.new(Entry::Fragment::FRAGMENT_TYPE[:text], match.pre_match) if match.pre_match.present?
        fragments << Entry::Fragment.new(Entry::Fragment::FRAGMENT_TYPE[:handle], match[0])
        content = match.post_match
      else
        fragments << Entry::Fragment.new(Entry::Fragment::FRAGMENT_TYPE[:text], content)
        content = nil
      end
    end

    fragments
  end
end
