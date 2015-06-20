# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new(
      :nama                  => "Admin",
      :email                 => "admin@carfix.co.id",
      :password              => "123456",
      :password_confirmation => "123456",
      :admin                 => true
  )
  user.skip_confirmation!
  user.save!
  
19.times do |n|
  name  = "Pelamar#{n}"
  email = "example-#{n}@example.org"
  password = "password"
  user = User.new( nama:  name,
            email: email,
            password:              password,
            password_confirmation: password,
            admin: false)
  user.skip_confirmation!
  user.save!
end

pendidikan = Pendidikan.new(:level_pend => "SMK")
pendidikan1 = Pendidikan.new(:level_pend => "SMA")
pendidikan2 = Pendidikan.new(:level_pend => "S1")
pendidikan3 = Pendidikan.new(:level_pend => "S2")
  pendidikan.save!
  pendidikan1.save!
  pendidikan2.save!
  pendidikan3.save!


jabatan = Jabatan.new(:nama_jabatan => "Mekanik")
jabatan1 = Jabatan.new(:nama_jabatan => "Driver")
jabatan2 = Jabatan.new(:nama_jabatan => "Marketing")
jabatan3 = Jabatan.new(:nama_jabatan => "Chief Store")
  jabatan.save!
  jabatan1.save!
  jabatan2.save!
  jabatan3.save!


lowongan = Lowongan.new(
      jabatan_id: 1,
      pendidikan_id: 1,
      limit_umur: 25,
      ket_umum: 'SMK Otomotif, Fresh Graduates',
      deskripsi: 'Sebagai seorang Mekanik, Anda akan bertugas di bengkel CARfix',
      posted: true,
      max_tgl:  20.day.from_now.localtime)
lowongan1 = Lowongan.new(
      jabatan_id: 2,
      pendidikan_id: 2,
      limit_umur: 30,
      ket_umum: 'Sudah berpengalaman menjadi driver',
      deskripsi: 'Sebagai seorang Driver, Anda akan 
      bertugas melakukan pengiriman barang CARfix',
      posted: true,
      max_tgl:  20.day.from_now.localtime)
lowongan2 = Lowongan.new(
      jabatan_id: 3,
      pendidikan_id: 3,
      limit_umur: 28,
      ket_umum: 'Menyukai bidang Marketing',
      deskripsi: 'Sebagai seorang Marketing, Anda akan 
      bertanggung jawab atas program penjualan dan pemasaran CARfix',
      posted: true,
      max_tgl:  10.day.from_now.localtime)
lowongan3 = Lowongan.new(
      jabatan_id: 4,
      pendidikan_id: 3,
      limit_umur: 30,
      ket_umum: 'Berpengalaman memimpin kantor cabang',
      deskripsi: 'Sebagai seorang Chief Store, Anda akan 
      bertanggung jawab memimpin cabang/bengkel CARfix',
      posted: true,
      max_tgl:  10.day.from_now.localtime)
  lowongan.save!
  lowongan1.save!
  lowongan2.save!
  lowongan3.save!
  
pengumumann = Pengumumann.new(
      judul: 'Contoh Pengumuman sederhana', 
      deskripsi: 'Contoh Deskripsi dari pengumuman sederhana')
pengumumann2 = Pengumumann.new(
      judul: 'Pengumuman Panggilan Semua Pelamar',
      deskripsi: 'Diharapkan untuk datang pada',
      tanggal: 2.day.from_now.localtime,
      tempat: 'CARfix Semarang',
      waktu: 2.day.from_now.localtime,
      kelengkapan: 'berpakaian rapi')
  pengumumann.save!
  pengumumann2.save!