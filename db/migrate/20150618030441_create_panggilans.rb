class CreatePanggilans < ActiveRecord::Migration
  def change
    create_table :panggilans do |t|
      t.references :pengumumann, index: true
      t.references :lamaran, index: true

      t.timestamps null: false
    end
    add_foreign_key :panggilans, :pengumumanns
    add_foreign_key :panggilans, :lamarans
    add_index :panggilans, [:lamaran_id, :pengumumann_id], unique: true
  end
end
