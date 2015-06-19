require 'test_helper'

class PanggilanTest < ActiveSupport::TestCase
  def setup
    @panggilan = Panggilan.new(pengumumann_id: 1, lamaran_id: 2)
  end

  test "should be valid" do
    assert @panggilan.valid?
  end

  test "should require a pengumumann_id" do
    @panggilan.pengumumann_id = nil
    assert_not @panggilan.valid?
  end

  test "should require a lamaran_id" do
    @panggilan.lamaran_id = nil
    assert_not @panggilan.valid?
  end
  
  test "should unique pair lamaran_id and pengumumann_id" do
    duplicate_panggilan = @panggilan.dup
    @panggilan.save
    assert_not duplicate_panggilan.valid?
  end
end
