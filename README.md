# Tugas Kelompok Pemrograman Berbasis Platform UAS Kelompok D09 TA 2022-2023
[![Build status](https://build.appcenter.ms/v0.1/apps/44c122d5-7b9c-4d5b-a827-ad3d61d01718/branches/main/badge)](https://appcenter.ms)
[![Release](https://github.com/rafighalibin/bin_bank_app/actions/workflows/release.yml/badge.svg)](https://github.com/rafighalibin/bin_bank_app/actions/workflows/release.yml)

## 👩🏻‍💻 Nama Anggota Kelompok 👨🏻‍💻

- Kausar Meutuwah - 2106630100
- Rafi Ghalibin Abrar - 2106751354
- Syifa Afra Kamila Mumtaz - 2106707151
- Muhammad Falensi Azmi - 2106630334
- Amanda Christie Tarigan - 2106751322 

## 🌐 Tautan 🌐
* Mobile App : https://install.appcenter.ms/orgs/bin_bank/apps/Bin-Bank-App
* Website App : https://bin-bank-pbp.up.railway.app/

## 📜 Cerita Aplikasi 📜

Masalah sampah di Indonesia masih menjadi polemik hingga menjadi salah satu isu penting dalam Presidensi G20 Indonesia 2022. Jumlah dan jenis sampah terus bertambah seiring pertumbuhan penduduk dan perkembangan teknologi, tetapi laju solusi pengelolaan sampah masih tertinggal jauh di belakang. BinBank merupakan salah satu solusi pengumpulan dan pengelolaan sampah yang melibatkan sistem seperti perbankan, tetapi yang ditabung bukanlah uang melainkan sampah. Nasabah yang merupakan masyarakat yang ingin mengirimkan sampahnya akan memiliki buku tabungan untuk mencatat riwayat pengiriman sampah dan uang yang diperoleh. 

**Bin-Bank** hadir sebagai aplikasi berbasis web yang bertujuan untuk mendukung kegiatan operasional bank sampah di seluruh Indonesia. Aplikasi ini memudahkan masyarakat untuk memperolah informasi secara efisien mengenai bank sampah dan kesehatan lingkungan. Selain itu, pengguna yang terdaftar pada aplikasi ini dapat lebih mudah mengirimkan sampahnya ke bank sampah terdekat dengan riwayat pengiriman yang tercatat pada aplikasi. 

## 📋 Daftar Modul dan Alur Pengintegrasian 📋

**1. Home 		: Amanda Christie Tarigan**

-> Merupakan welcoming page yang berisi penjelasan singkat aplikasi Bin Bank, menampilkan artikel, jumlah penerimaan sampah, location, dan form feedback. Cara pengintegrasiannya adalah sebagai berikut. Pada halaman ini, user dapat mengirim feedback untuk testimoni dan evaluasi bagi Bin Bank melalui form yang akan dikirim dengan HTTP Post. Feedback message diambil dengan HTTP get dari server dan ditampilkan di aplikasi.

**2. Authentication	: Syifa Afra Kamila Mumtaz**

-> Merupakan modul untuk login, registrasi, logout sebagai user. Cara pengintegrasiannya adalah melakukan validasi user dengan pemanggilan asinkronus HTTP GET saat membuat form login pada aplikasi flutter. Untuk mengintegrasikan dengan aplikasi web yang sudah dibuat saat Proyek Tengah Semester, maka perlu dibuat views di aplikasi web tersebut supaya aplikasi mobile ini dapat mengirimkan datanya ke aplikasi web untuk divalidasi.

**3. Leaderboard 	: Muhammad Falensi Azmi**

-> Menampilkan peringkat user berdasarkan total sampah yang dikirim, pesan semangat, dan pencarian peringkat berdasarkan username. Cara pengintegrasiannya adalah sebagai berikut. Fitur ini akan mengambil data user beserta poinnya (dengan HTTP get) dan diurutkan berdasarkan poin tertinggi. Sepuluh user dengan poin tertinggi akan ditampilkan di aplikasi Flutter. Selain itu, user juga dapat mengirim pesan semangat untuk membuat user lebih termotivasi menggunakan bank sampah. Pesan-pesan ini akan diambil (dengan HTTP get) dari server dan ditampilkan di aplikasi. User juga bisa mengirim pesan semangat melalui form yang selanjutnya akan dikirim dengan HTTP post agar dapat tersimpan di server. Untuk mencari peringkat user, tersedia fitur pencarian user yang akan diimplementasikan dengan HTTP get untuk memperoleh data tentang user tersebut di server. Semua HTTP request di atas dilakukan ke aplikasi web yang sudah dibuat pada saat Proyek Tengah Semester.

**4. History		: Rafi Ghalibin Abrar**

-> Menampilkan riwayat transaksi user dalam card. Cara pengintegrasiannya adalah dengan melakukan HTTP GET pada setiap filter transaksi. Pada apliaksi web sudah 
    terdapat beberapa method views yang mengirimkan data transaksi dalam bentuk json, namun terdapat beberapa method yang perlu ditambahkan untuk menunjukan data 
    transaksi yang sudah di-filter.

**5. Deposit Sampah	: Kausar Meutuwah**

-> Menghitung jumlah sampah dan harganya, memilih bank sampah. Cara pengintegrasiannya adalah sebagai berikut. Pertama - tama,  modul deposit sampah akan mengambil data deposit sampah user dari webservice menggunakan HTTP get. Selanjutnya DepositSampah akan menampilkan sebuah form. Form tersebut akan menerima data dari user dan mengirimkannya ke WebService menggunakan HTTP Post.

## 👥 Role atau Peran Pengguna 👥

**1. 🔒 User (Donatur Sampah) 🔒**

- Harus terautentikasi melalui halaman login
- Dapat mengakses seluruh page pada website

**2. 🔓 Masyarakat 🔓**

- Tidak perlu melakukan login
- Hanya dapat mengakses home page
