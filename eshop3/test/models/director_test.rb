require 'test_helper'

class DirectorTest < ActiveSupport::TestCase
  fixtures :directors

  test "failing_create" do
  	director = Director.new
	assert_equal false, director.save
	assert_equal 4, director.errors.count
        assert director.errors[:first_name]
	assert director.errors[:last_name]
  end

  test "create" do
    	director = Director.new(
			:first_name => 'Paco',
			:last_name => 'Alvarez')
    	assert director.save
	assert_equal 'Paco Alvarez', director.name
  end
end
