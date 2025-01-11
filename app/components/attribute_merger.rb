class AttributeMerger
  attr_reader :default_attrs, :user_attrs

  def initialize(default_attrs, user_attrs)
    @default_attrs = default_attrs
    @user_attrs = user_attrs
  end

  def merge
    merge_attributes(default_attrs, user_attrs)
  end

  private
  def merge_attributes(*args)
    args.each_with_object({}) do |object, result|
      result.merge! object do |_key, old, new|
        merge_values(old, new)
      end
    end
  end

  def merge_values(old, new)
    case old
    when String
      new.is_a?(String) ? "#{old} #{new}" : new
    when Hash
      new.is_a?(Hash) ? merge_attributes(old, new) : new
    when Array
      new.is_a?(Array) ? old + new : new
    else
      new
    end
  end
end
