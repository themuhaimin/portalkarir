class CreatePengumumanns < ActiveRecord::Migration
  def change
    create_table :pengumumanns do |t|
      t.string :judul, null: false
      t.text :deskripsi, null: false
      t.datetime :tanggal
      t.string :tempat
      t.datetime :waktu
      t.text :kelengkapan

      t.timestamps null: false
    end
  end
end
