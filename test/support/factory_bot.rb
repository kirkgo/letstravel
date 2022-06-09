# frozen_string_literal: true

require 'faker'

module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods
  end
end
