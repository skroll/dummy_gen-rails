require 'rails/generators'

module DummyGen
  class DummyAppTaskGenerator < Rails::Generators::NamedBase
    argument :engine_name, :type => :string
    class_option :lib_root,
      type:    :string,
      default: "lib",
      desc:    "lib root directory"

    class_option :dummy_path,
      type:    :string,
      default: "spec/dummy",
      desc:    "Dummy application path"

    def self.source_paths
      paths = self.superclass.source_paths
      paths << File.expand_path("../templates", __FILE__)
      paths.flatten
    end

    def generate_task
      puts application_name
      template "dummy_app.rake", "#{lib_root}/tasks/#{file_name}.rake"
    end

    protected
    def lib_root
      options[:lib_root]
    end

    def dummy_path
      options[:dummy_path]
    end
  end
end

