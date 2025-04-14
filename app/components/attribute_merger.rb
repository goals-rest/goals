class AttributeMerger
  def self.merge(*args)
    args.each_with_object({}) do |object, result|
      result.merge!(object) do |_key, old, new|
       case [ old, new ].freeze
       in [Array, Array] | [Set, Set]
          old + new
       in [Array, Set]
          old + new.to_a
       in [Array, String]
          old + [ new ]
       in [Hash, Hash]
          merge(old, new)
       in [Set, Array]
          old.to_a + new
       in [Set, String]
          old.to_a + [ new ]
       in [String, Array]
          [ old ] + new
       in [String, Set]
          [ old ] + new.to_a
       in [String, String]
          "#{old} #{new}"
       in [_, Hash]
          { _: old, **new }
       in [Hash, _]
          { **old, _: new }
       in [_, nil]
          old
       else
          new
       end
      end
    end
  end
end
