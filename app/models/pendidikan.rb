class Pendidikan < ActiveRecord::Base
  validates :level_pend,  presence: true, uniqueness: { case_sensitive: false }
end
