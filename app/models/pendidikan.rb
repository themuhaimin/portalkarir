class Pendidikan < ActiveRecord::Base
  has_many  :profils
  has_many :lowongans
  validates :level_pend,  presence: true, uniqueness: true
end

