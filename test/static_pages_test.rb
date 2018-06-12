require_relative 'test_helper'

class MyAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    heading = 'Sample Sinatra App'
    assert last_response.body.include?(heading)
  end

  def test_about
    get '/about'
    assert last_response.ok?
  end
end
