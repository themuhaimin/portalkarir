require 'test_helper'

class LowonganTest < ActiveSupport::TestCase
 setup do
   @lowongan = Lowongan.new(
      jabatan_id: 1,
      pendidikan_id: 2,
      limit_umur: 25,
      ket_umum: 'SMK Otomotif, Fresh Graduates',
      deskripsi: 'Sebagai seorang Mekanik, Anda akan bertugas di bengkel CARfix',
      posted: true,
      max_tgl:  20.day.from_now.localtime )
  end
  
  test "contoh harusnya valid" do
    assert @lowongan.valid?
  end
  
  test "ket_umum tidak boleh kosong" do
    @lowongan.ket_umum ="     "
    assert_not @lowongan.valid?
  end
  
  test "deskripsi tidak boleh kosong" do
    @lowongan.deskripsi ="     "
    assert_not @lowongan.valid?
  end
  
  test "max_tgl tidak boleh kurang dari hari ini" do
    @lowongan.max_tgl = Time.now - 2.days
    assert_not @lowongan.valid?
  end
  
end
