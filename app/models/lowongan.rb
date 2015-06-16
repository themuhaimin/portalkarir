class Lowongan < ActiveRecord::Base
  belongs_to :jabatan
  belongs_to :pendidikan
  has_many :lamarans, dependent: :destroy
  accepts_nested_attributes_for :lamarans
  
  validates :limit_umur, :ket_umum, :deskripsi,  presence: true
  validate :max_tgl_harus_di_masa_depan
  after_initialize :cek_posted
  
  def max_tgl_harus_di_masa_depan
    if max_tgl < Date.today
      errors.add(:max_tgl, "Tidak boleh sebelum hari ini")
    end
  end
  
  def cek_posted
    self.posted = false if self.posted.nil?
  end
end
