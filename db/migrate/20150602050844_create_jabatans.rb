class CreateJabatans < ActiveRecord::Migration
  def change
    create_table :jabatans do |t|
      t.string :nama_jabatan,  null: false, default: ""

      t.timestamps null: false
      add_index :jabatans, :nama_jabatan,        unique: true
    end
  end
end
