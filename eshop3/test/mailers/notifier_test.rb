require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "password_reset_instructions" do
	@user=User.create(
		:name => 'George Jackson',
		:login => 'George',
		:email => 'eshop3email@gmail.com',
		:password => 'silver',
		:password_confirmation => 'silver')
	mail=Notifier.password_reset_instructions(@user)
	assert_equal 'Instrucciones para restaurar su contraseña', mail.subject
	assert_equal ['eshop3email@gmail.com'], mail.to
	assert_equal 'Notificador Crazy Films', mail.from
	assert_match "Estimado #{@user.name}:", mail.body.encoded
  end
end
