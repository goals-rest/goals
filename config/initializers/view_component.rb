ActiveSupport.on_load(:view_component) do
  ViewComponent::Preview.extend ViewComponentContrib::Preview::Sidecarable
end
