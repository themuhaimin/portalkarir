class CreatePendidikans < ActiveRecord::Migration
  def change
    create_table :pendidikans do |t|
      t.string :level_pend

      t.timestamps null: false
    end
  end
end
