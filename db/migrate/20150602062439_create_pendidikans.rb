class CreatePendidikans < ActiveRecord::Migration
  def change
    create_table :pendidikans do |t|
      t.string :level_pend

      t.timestamps null: false
    end
    add_index :pendidikans, :level_pend, unique: true
  end
end
