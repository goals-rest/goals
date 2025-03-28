class Handle
  HANDLE_PATTERN = /\A@[a-zA-Z0-9_]([a-zA-Z0-9_]|\.[a-zA-Z0-9_])+\z/

  attr_reader :value

  def initialize(value)
    raise ArgumentError, "Invalid handle" unless value.match?(HANDLE_PATTERN)

    @value = value
  end

  def username
    value[1..]
  end

  def self.from_username(username)
    new("@#{username}")
  end

  def to_s
    value
  end

  def ==(other)
    other.is_a?(Handle) && value == other.value
  end
end
