class CreateLowongans < ActiveRecord::Migration
  def change
    create_table :lowongans do |t|
      t.references :jabatan, index: true
      t.references :pendidikan, index: true
      t.integer :limit_umur
      t.text :ket_umum, null: false
      t.text :deskripsi, null: false
      t.boolean :posted
      t.datetime :max_tgl, null: false

      t.timestamps null: false
    end
    add_foreign_key :lowongans, :jabatans
    add_foreign_key :lowongans, :pendidikans
  end
end
