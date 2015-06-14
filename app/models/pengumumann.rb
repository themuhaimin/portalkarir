class Pengumumann < ActiveRecord::Base
  validates :judul, :deskripsi, presence: true
  validate :tanggal_harus_di_masa_depan
  
  def tanggal_harus_di_masa_depan
    if !tanggal.nil? && tanggal < Date.today
      errors.add(:tanggal, "Tidak boleh sebelum hari ini")
    end
  end
  
end
