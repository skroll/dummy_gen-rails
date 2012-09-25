require "rails/generators"
require "rails/generators/rails/app/app_generator"
require "active_support/core_ext/hash/slice"

module DummyGen
  module Generators
    class DummyGenerator < Rails::Generators::Base
      argument :engine_name, :type => :string

      def self.source_paths
        paths = self.superclass.source_paths
        paths << File.expand_path("../dummy_templates", __FILE__)
        paths.flatten
      end

      PASSTHROUGH_OPTIONS = [
        :skip_active_record, :skip_javascript, :database, :javascript, :quiet,
        :pretend, :force, :skip
      ]

      def generate_test_dummy
        opts = (options || {}).slice(*PASSTHROUGH_OPTIONS)
        opts[:force] = true
        opts[:skip_bundle] = true

        invoke Rails::Generators::AppGenerator,
          [ File.expand_path(dummy_path, destination_root) ], opts
      end

      def test_dummy_clean
        inside dummy_path do
          remove_file ".gitignore"
          remove_file "doc"
          remove_file "Gemfile"
          remove_file "lib/tasks"
          remove_file "app"
          remove_file "public/index.html"
          remove_file "public/robots.txt"
          remove_file "README.rdoc"
          remove_file "test"
          remove_file "vendor"
        end
      end

      def test_dummy_config
        directory "app", "#{dummy_path}/app"
        template "Rakefile", "#{dummy_path}/Rakefile", :force => true
        [ "application.rb", "boot.rb", "database.yml", "routes.rb" ].each do |t|
          template "config/#{t}", "#{dummy_path}/config/#{t}", :force => true
        end
        template "config/initializers/engine_initializer.rb", "#{dummy_path}/config/initializers/#{engine_name}.rb", :force => true
      end

      protected
      def engine_namespace
        engine_name.camelize
      end

      def engine_mount
        engine_name
      end

      def dummy_path
        "spec/dummy"
      end

      def dummy_module_name
        "Dummy"
      end

      def dummy_app_requires
        [ "jquery-rails", "#{engine_name}", "#{engine_name}/engine" ]
      end

      def dummy_application_definition
        @dummy_application_definition ||= begin
          dummy_application_path = File.expand_path("#{dummy_path}/config/application.rb", destination_root)
          unless options[:pretend] || !File.exists?(dummy_application_path)
            contents = File.read(dummy_application_path)
            contents[(contents.index("module #{dummy_module_name}"))..-1]
          end
        end
      end

      def gemfile_path
        "../../../../Gemfile"
      end
    end
  end
end

