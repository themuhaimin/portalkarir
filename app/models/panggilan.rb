class Panggilan < ActiveRecord::Base
  belongs_to :pengumumann
  belongs_to :lamaran
  validates :pengumumann_id, :lamaran_id, presence: true
  validates :pengumumann_id, uniqueness: { scope: [:lamaran_id] }
end
