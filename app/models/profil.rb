class Profil < ActiveRecord::Base
  belongs_to :user
  belongs_to :pendidikan
  validates :user_id, :nama_lengkap, :no_identitas, :alamat, :tempat_lahir, 
            :tgl_lahir, :pendidikan_id, :nama_pend, :jurusan,
            presence: true
  validates :no_hp, length: { in: 6..14 }
end
