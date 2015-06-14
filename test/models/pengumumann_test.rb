require 'test_helper'

class PengumumannTest < ActiveSupport::TestCase
  def setup
  @pengumumann = Pengumumann.new(judul: "Contoh_Pengumuman", deskripsi:"Contoh_Deskripsi")
  @pengumumann1 = pengumumanns(:satu)
  end
  
  test "contoh harusnya valid" do
    assert @pengumumann.valid?
  end
  
  test "judul tidak boleh kosong" do
    @pengumumann.judul ="     "
    assert_not @pengumumann.valid?
  end
  
  test "deskripsi tidak boleh kosong" do
    @pengumumann.deskripsi ="     "
    assert_not @pengumumann.valid?
  end
  
  test "fixtures harusnya valid" do
    assert @pengumumann1.valid?
  end
  
  test "jika tanggal ada harus di masa depan" do
    @pengumumann1.tanggal = Date.today - 1
    assert_not @pengumumann1.valid?
  end
  
  
end
