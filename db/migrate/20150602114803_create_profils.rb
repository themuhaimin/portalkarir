class CreateProfils < ActiveRecord::Migration
  def change
    create_table :profils do |t|
      t.belongs_to :user, index: true
      t.string :nama_lengkap, null: false
      t.string :no_identitas, null: false
      t.boolean :jenis_kelamin
      t.text :alamat, null: false
      t.string :tempat_lahir, null: false
      t.datetime :tgl_lahir, null: false
      t.string :no_hp, null: false
      t.references :pendididikan, index: true
      t.string :nama_pend, null: false
      t.string :jurusan, null: false
      t.float :nilai

      t.timestamps null: false
    end
    add_foreign_key :profils, :users
    add_foreign_key :profils, :pendididikans
  end
end
