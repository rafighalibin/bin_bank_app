# Tugas Kelompok Pemrograman Berbasis Platform UAS Kelompok D09 TA 2022-2023
## 👩🏻‍💻 Nama Anggota Kelompok 👨🏻‍💻

- Kausar Meutuwah - 2106630100
- Rafi Ghalibin Abrar - 2106751354
- Syifa Afra Kamila Mumtaz - 2106707151
- Muhammad Falensi Azmi - 2106630334
- Amanda Christie Tarigan - 2106751322 

## 🌐 Tautan 🌐
https://bin-bank-pbp.herokuapp.com/

## 📜 Cerita Aplikasi 📜

Masalah sampah di Indonesia masih menjadi polemik hingga menjadi salah satu isu penting dalam Presidensi G20 Indonesia 2022. Jumlah dan jenis sampah terus bertambah seiring pertumbuhan penduduk dan perkembangan teknologi, tetapi laju solusi pengelolaan sampah masih tertinggal jauh di belakang. Bank Sampah merupakan salah satu solusi pengumpulan dan pengelolaan sampah yang melibatkan sistem seperti perbankan, tetapi yang ditabung bukanlah uang melainkan sampah. Nasabah yang merupakan masyarakat yang ingin mengirimkan sampahnya akan memiliki buku tabungan untuk mencatat riwayat pengiriman sampah dan uang yang diperoleh. 

**Bin-Bank** hadir sebagai aplikasi berbasis web yang bertujuan untuk mendukung kegiatan operasional bank sampah di seluruh Indonesia. Aplikasi ini memudahkan masyarakat untuk memperolah informasi secara efisien mengenai bank sampah dan kesehatan lingkungan. Selain itu, pengguna yang terdaftar pada aplikasi ini dapat lebih mudah mengirimkan sampahnya ke bank sampah terdekat dengan riwayat pengiriman yang tercatat pada aplikasi. 

## 📋 Daftar Modul yang Akan Diimplementasikan 📋

**1. Home 		: Amanda Christie Tarigan**

   -> Welcome, artikel, jumlah penerimaan sampah, location, feedback

**2. Authentication	: Syifa Afra Kamila Mumtaz**

   -> Merupakan modul untuk login, registrasi, logout sebagai user. Cara pengintegrasiannya adalah melakukan validasi user dengan pemanggilan asinkronus HTTP GET saat membuat form login pada aplikasi flutter. Untuk mengintegrasikan dengan aplikasi web yang sudah dibuat saat Proyek Tengah Semester, maka perlu dibuat views di aplikasi web tersebut supaya aplikasi mobile ini dapat mengirimkan datanya ke aplikasi web untuk divalidasi.

**3. Leaderboard 	: Muhammad Falensi Azmi**

    -> Menampilkan peringkat user berdasarkan total sampah yang dikirim, pesan semangat, dan pencarian peringkat berdasarkan username. Cara pengintegrasiannya adalah sebagai berikut. Fitur ini akan mengambil data user beserta poinnya (dengan HTTP get) dan diurutkan berdasarkan poin tertinggi. Sepuluh user dengan poin tertinggi akan ditampilkan di aplikasi Flutter. Selain itu, user juga dapat mengirim pesan semangat untuk membuat user lebih termotivasi menggunakan bank sampah. Pesan-pesan ini akan diambil (dengan HTTP get) dari server dan ditampilkan di aplikasi. User juga bisa mengirim pesan semangat melalui form yang selanjutnya akan dikirim dengan HTTP post agar dapat tersimpan di server. Untuk mencari peringkat user, tersedia fitur pencarian user yang akan diimplementasikan dengan HTTP get untuk memperoleh data tentang user tersebut di server. Semua HTTP request di atas dilakukan ke aplikasi web yang sudah dibuat pada saat Proyek Tengah Semester.

**4. History		: Rafi Ghalibin Abrar**

    -> Menampilkan riwayat transaksi user dalam card. Cara pengintegrasiannya adalah dengan melakukan HTTP GET pada setiap filter transaksi. Pada apliaksi web sudah 
    terdapat beberapa method views yang mengirimkan data transaksi dalam bentuk json, namun terdapat beberapa method yang perlu ditambahkan untuk menunjukan data 
    transaksi yang sudah di-filter.

**5. Deposit Sampah	: Kausar Meutuwah**

   -> Menghitung jumlah sampah dan harganya, memilih bank sampah

## 👥 Role atau Peran Pengguna 👥

**1. 🔒 User (Donatur Sampah) 🔒**

- Harus terautentikasi melalui halaman login
- Dapat mengakses seluruh page pada website

**2. 🔓 Masyarakat 🔓**

- Tidak perlu melakukan login
- Hanya dapat mengakses home page

## Alur Pengintegrasian 
