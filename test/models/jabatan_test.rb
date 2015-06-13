require 'test_helper'

class JabatanTest < ActiveSupport::TestCase
  
  def setup
  @jabatan = Jabatan.new(nama_jabatan: "Contoh_Jabatan")
  end
  
  test "contoh harusnya valid" do
    assert @jabatan.valid?
  end
  
  test "nama_jabatan tidak boleh kosong" do
    @jabatan.nama_jabatan ="     "
    assert_not @jabatan.valid?
  end
  
  test "nama_jabatan harus unique" do
    duplicate_jabatan = @jabatan.dup
    @jabatan.save
    assert_not duplicate_jabatan.valid?
  end
  
end
