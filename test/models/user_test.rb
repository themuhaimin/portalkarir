require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
  @user = User.new(nama: "Example User", email: "user@example.com",
          password: "foobar", password_confirmation: "foobar")
  end

  test "contoh harusnya valid" do
    assert @user.valid?
  end
  
  test "nama tidak boleh kosong" do
    @user.nama = "     "
    assert_not @user.valid?
  end
  
  test "email tidak boleh kosong" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email dengan alamat yang valid" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email dengan alamat yang tidak valid" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email harus unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password tidak boleh kurang dari 6 karakter" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "email disimpan lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

end
