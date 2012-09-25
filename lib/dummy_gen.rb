require "dummy_gen/version"
require "active_support/dependencies/autoload"

module DummyGen
  extend ::ActiveSupport::Autoload

  autoload :Generators
end

