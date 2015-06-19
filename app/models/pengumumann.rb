class Pengumumann < ActiveRecord::Base
  validates :judul, :deskripsi, presence: true
  validate :tanggal_harus_di_masa_depan
  has_many :panggilans, dependent: :destroy
  accepts_nested_attributes_for :panggilans
  validate :tanggal_harus_di_masa_depan
  
  def tanggal_harus_di_masa_depan
    if !tanggal.nil? && tanggal < Date.today
      errors.add(:tanggal, "Tanggal tidak boleh sebelum hari ini")
    end
  end
  
end
