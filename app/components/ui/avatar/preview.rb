module UI
  module Avatar
    class Preview < ViewComponent::Preview
      # @param size select { choices: [ xs, sm, base, lg ] }
      def playground(size: :base)
        render UI::Avatar::Component.new(
          src: "https://i.pravatar.cc/300",
          size:
        )
      end

      # @param size select { choices: [ xs, sm, base, lg ] }
      def with_placeholder(size: :base)
        render UI::Avatar::Component.new(size:) do |avatar|
          avatar.with_placeholder
        end
      end
    end
  end
end
