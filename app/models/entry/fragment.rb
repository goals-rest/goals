class Entry::Fragment
  FRAGMENT_TYPE = {
    text: 0,
    handle: 1
  }.freeze

  attr_reader :type, :value

  def initialize(type, value)
    raise ArgumentError, "Invalid fragment type" unless FRAGMENT_TYPE.values.include?(type)
    raise ArgumentError, "Invalid fragment value" unless value.present?

    @type = type
    @value = value
  end
end
