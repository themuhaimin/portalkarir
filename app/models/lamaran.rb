class Lamaran < ActiveRecord::Base
  belongs_to :user
  belongs_to :lowongan
  validates :user_id, :lowongan_id, presence: true
  
end
