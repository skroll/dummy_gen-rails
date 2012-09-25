Rails.application.routes.draw do
  root :to => 'home#index'

  mount <%= engine_namespace %>::Engine, :at => "/<%= engine_mount %>"
end

