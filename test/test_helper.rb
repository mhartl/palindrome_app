ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'rack/test'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
