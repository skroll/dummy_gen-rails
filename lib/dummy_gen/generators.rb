require "active_support/dependencies/autoload"

module DummyGen
  module Generators
    extend ::ActiveSupport::Autoload

    autoload :DummyGenerator
  end
end
