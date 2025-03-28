class HandleTextParser
  HANDLE_PATTERN = /(@[a-zA-Z0-9_]([a-zA-Z0-9_]|\.[a-zA-Z0-9_])+)/

  def initialize(text)
    @text = text
  end

  def parse
    @text.scan(HANDLE_PATTERN).map { Handle.new(it.first) }
  end
end
