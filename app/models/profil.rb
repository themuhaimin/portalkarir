class Profil < ActiveRecord::Base
  belongs_to :user
  belongs_to :pendidikan
  validates :user_id, :nama_lengkap, :no_identitas, :alamat, :tempat_lahir, 
            :tgl_lahir, :pendidikan_id, :nama_pend, :jurusan,
            presence: true
  validates :no_hp,format: { with: /\A[0-9]+\z/,
            message: "hanya boleh angka" }, length: { in: 6..14 }
end
