require File.expand_path("../boot", __FILE__)

require "rails/all"

Bundler.require

<%- dummy_app_requires.each do |req| -%>
require "<%= req %>"
<%- end -%>

<%= dummy_application_definition %>

