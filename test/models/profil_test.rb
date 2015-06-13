require 'test_helper'

class ProfilTest < ActiveSupport::TestCase
  
  setup do
    @profil = Profil.new(
      user_id: 1,
      nama_lengkap: 'Admin',
      no_identitas: '111111111',
      jenis_kelamin: true,
      alamat: 'Jl. aaaaaa',
      tempat_lahir: 'Jakarta',
      tgl_lahir: Time.now,
      no_hp: '085555555',
      pendidikan_id: 1,
      nama_pend: 'aaaaaaa',
      jurusan: 'aaaaaa',
      nilai: 8.8)
  end
  
  test "contoh harusnya valid" do
    assert @profil.valid?
  end
  
  test "nama_lengkap tidak boleh kosong" do
    @profil.nama_lengkap ="     "
    assert_not @profil.valid?
  end
  
  test "alamat tidak boleh kosong" do
    @profil.alamat ="     "
    assert_not @profil.valid?
  end
  
  test "no_hp tidak boleh kurang dari 6 digit" do
    @profil.no_hp ="444"
    assert_not @profil.valid?
  end
  
  test "nama_pend tidak boleh kosong" do
    @profil.nama_pend ="     "
    assert_not @profil.valid?
  end
  
end
