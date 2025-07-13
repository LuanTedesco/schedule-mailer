require "test_helper"

class UserTest < ActiveSupport::TestCase
  # Verifica se o usuário não é salvo sem o campo nome
  test "should not save user without name" do
    user = User.new(email: "test@example.com", password: "123456")
    assert_not user.save, "Saved the user without a name"
  end

  # Verifica se o usuário não é salvo sem o campo email
  test "should not save user without email" do
    user = User.new(name: "Test User", password: "123456")
    assert_not user.save, "Saved the user without an email"
  end

  # Verifica se o usuário não é salvo sem o campo email
  test "should save valid user" do
    user = User.new(name: "Test User", email: "test@example.com", password: "123456")
    assert user.save, "Couldn't save a valid user"
  end
end
