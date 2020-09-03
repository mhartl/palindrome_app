require_relative 'test_helper'

class PalindromeAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_form_presence
    get '/palindrome'
    assert doc(last_response).at_css('form')
  end

  def test_non_palindrome_submission
    post '/check', phrase: "Not a palindrome"
    assert_includes doc(last_response).at_css('p').text, "isn't a palindrome"
    assert doc(last_response).at_css('form')
  end

  def test_palindrome_submission
    post '/check', phrase: "Able was I, ere I saw Elba."
    assert_includes doc(last_response).at_css('p').text, "is a palindrome"
  end
end
