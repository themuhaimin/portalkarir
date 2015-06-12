class Jabatan < ActiveRecord::Base
  validates :nama_jabatan,  presence: true, uniqueness: true
end
