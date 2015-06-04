require 'test_helper'

class PendidikanTest < ActiveSupport::TestCase
  
  def setup
  @pendidikan = Pendidikan.new(level_pend: "Contoh_Pendidikan")
  end
  
  test "contoh harusnya valid" do
    assert @pendidikan.valid?
  end
  
  test "level_pend tidak boleh kosong" do
    @pendidikan.level_pend ="     "
    assert_not @pendidikan.valid?
  end
  
  test "level_pend harus unique" do
    duplicate_pendidikan = @pendidikan.dup
    @pendidikan.save
    assert_not duplicate_pendidikan.valid?
  end
  
end
