# frozen_string_literal: true

require "lol/version"
require "lol/routing"
require "lol/controller"

module Lol
  class Application
    def call(env)
      if env["PATH_INFO"] == "/favicon.ico"
        return [
          400,
          { "Content-Type" => "text/html" },
          []
        ]
      end

      klass, action = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(action)
      [
        200,
        {'Content-Type' => 'text/html'},
        [text]
      ]
    end
  end
end
