class Lamaran < ActiveRecord::Base
  belongs_to :user
  belongs_to :lowongan
  default_scope -> { order(created_at: :desc) }
  validates :user_id, :lowongan_id, presence: true
  validates :user_id, uniqueness: { scope: :lowongan_id,
      message: "Lowongan ini udah Anda lamar"}
  has_many :panggilans, dependent: :destroy
  accepts_nested_attributes_for :panggilans
end
