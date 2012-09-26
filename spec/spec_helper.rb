require 'bundler/setup'
require 'ammeter/init'

Bundler.require

module DummyGenSpec
  def self.tmp_path
    File.expand_path('../../tmp', __FILE__)
  end
end

