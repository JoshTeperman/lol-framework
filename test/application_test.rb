require_relative "test_helper"

class TestApp < Lol::Application
end

class LolAppTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/"
    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
    assert_equal last_response.status, 200
  end
end
