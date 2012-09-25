require 'dummy_gen'

namespace :<%= file_name %> do
  desc "Generate a dummy application"
  task :generate => [:setup, :migrate]

  task :setup do
    DummyGen::Generators::DummyGenerator.start(
      [
        "--quiet",
        "--dummy_path=<%= dummy_path %>",
        "<%= engine_name %>",
    ])
  end

  task :migrate do
    # Add migration operations here
  end

  desc "Destroy the dummy application"
  task :destroy do
    FileUtils.rm_rf "<%= dummy_path %>" if File.exists?("<%= dummy_path %>")
  end
end

