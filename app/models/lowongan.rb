class Lowongan < ActiveRecord::Base
  belongs_to :jabatan
  belongs_to :pendidikan
end
