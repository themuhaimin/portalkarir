class CreateLamarans < ActiveRecord::Migration
  def change
    create_table :lamarans do |t|
      t.references :user, index: true
      t.references :lowongan, index: true
      t.boolean :dipanggil
      t.timestamps null: false
    end
    add_index :lamarans, [:user_id, :lowongan_id], unique: true
  end
end
