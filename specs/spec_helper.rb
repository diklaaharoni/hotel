require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'awesome_print'
require 'date'
# Add simplecov

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../lib/room'
require_relative '../lib/reservation'
require_relative '../lib/period'
require_relative '../lib/front_desk'
