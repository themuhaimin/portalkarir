class Jabatan < ActiveRecord::Base
  validates :nama_jabatan,  presence: true, uniqueness: { case_sensitive: false }
end
