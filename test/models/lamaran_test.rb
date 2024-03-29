require 'test_helper'

class LamaranTest < ActiveSupport::TestCase
  def setup
    @lamaran = Lamaran.new(user_id: 1, lowongan_id: 2)
  end

  test "should be valid" do
    assert @lamaran.valid?
  end

  test "should require a user_id" do
    @lamaran.user_id = nil
    assert_not @lamaran.valid?
  end

  test "should require a lowongan_id" do
    @lamaran.lowongan_id = nil
    assert_not @lamaran.valid?
  end
  
  test "should unique pair user_id and lowongan_id" do
    duplicate_lamaran = @lamaran.dup
    @lamaran.save
    assert_not duplicate_lamaran.valid?
  end
  
end
