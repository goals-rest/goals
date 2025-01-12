module UI
  module Header
    class Component < ApplicationComponent
      renders_one :logo
      renders_many :links, Header::LinkComponent
      renders_many :items, ApplicationComponent
    end
  end
end
