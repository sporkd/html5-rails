module Html5
  module Rails
    class Engine < ::Rails::Engine
      
      # initializer "html5_rails_engine.helper" do |app|
      #   ActiveSupport.on_load(:action_controller) do
      #     include Html5::Rails::BoilerplateHelpers
      #   end
      # end

      initializer 'html5_rails_engine.helper' do |app|
        #ActionView::Base.send :include, Html5::Rails::BoilerplateHelpers
        ActionController::Base.helper(Html5::Rails::BoilerplateHelpers)
      end

      # initializer 'html5_rails_engine.controller' do |app|
      #   ActiveSupport.on_load(:action_controller) do
      #     include Html5RailsEngineActionControllerExtension
      #   end
      # end

    end
  end
end
