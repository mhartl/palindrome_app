require_relative 'test_helper'

class PalindromeAppTest < Minitest::Test
  # include Rack::Test::Methods

  # def app
  #   Sinatra::Application
  # end

  def setup
    @base_title = "Learn Enough Ruby Sample App"
  end

  def test_index
    get '/'
    assert last_response.ok?
    document = doc(last_response)
    title = document.at_css('title').text
    assert_includes title, @base_title
    assert_includes title, 'Home'
    navlist = document.at_css('ul.header-nav')
    assert navlist
  end

  def test_about
    get '/about'
    assert last_response.ok?
    title = doc(last_response).at_css('title').text
    assert_includes title, @base_title
    assert_includes title, 'About'
  end

  def test_palindrome_page
    get '/palindrome'
    assert last_response.ok?
    title = doc(last_response).at_css('title').text
    assert_includes title, @base_title
    assert_includes title, 'Palindrome Detector'
  end

  def test_base_title
    %w[/ about palindrome].each do |url|
      get url
      title = doc(last_response).at_css('title').text
      assert_includes title, @base_title
    end
  end
end
