require "test_helper"

class EmailTest < ActiveSupport::TestCase
  # Verifica se o email não é salvo quando o campo subject está vazio
  test "should save email" do
    email = Email.new(to:'test@test.com', subject:'Title', body: "Hello!", user_id:User.last)
    assert_not email.save, "Saved the email without a subject"
  end
end
