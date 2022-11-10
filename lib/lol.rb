# frozen_string_literal: true

require "lol/version"

module Lol
  class Application
    def call(env)
      [200, {'Content-Type' => 'text/html'}, ["Hello from lol-framework"]]
    end
  end
end
