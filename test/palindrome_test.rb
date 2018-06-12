require_relative 'test_helper'

class MyAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_palindrome_page
    get '/palindrome'
    assert last_response.ok?
  end

  def test_non_palindrome_submission
    non_palindrome = "Not a palindrome"
    post '/check', phrase: non_palindrome
    assert last_response.body.include?('isn\'t a palindrome')
  end


  def test_palindrome_submission
    palindrome = "Able was I, ere I saw Elba."
    post '/check', phrase: palindrome
    assert last_response.body.include?('is a palindrome')
  end
end
