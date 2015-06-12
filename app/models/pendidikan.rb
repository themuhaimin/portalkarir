class Pendidikan < ActiveRecord::Base
  has_many  :profil
  validates :level_pend,  presence: true, uniqueness: true
end

