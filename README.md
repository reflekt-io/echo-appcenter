# reflekt.io - echo

[![Develop](https://github.com/reflekt-io/echo/actions/workflows/develop.yml/badge.svg)](https://github.com/reflekt-io/echo/actions/workflows/develop.yml)
[![Pre-Release](https://github.com/reflekt-io/echo/actions/workflows/pre-release.yml/badge.svg)](https://github.com/reflekt-io/echo/actions/workflows/pre-release.yml)
[![Release](https://github.com/reflekt-io/echo/actions/workflows/release.yml/badge.svg)](https://github.com/reflekt-io/echo/actions/workflows/release.yml)

Sebuah tempat baru yang akan menjadi tempat aman untuk merefleksikan diri, berkeluh kesah, memberikan semangat kepada sesama, dan menyuarakan harapan tanpa rasa takut.

**Kini, dapat diakses secara langsung melalui ponsel.**

> Proyek ini dibuat untuk memenuhi tugas Proyek Akhir Semester (PAS)
> pada mata kuliah Pemrograman Berbasis Platform (CSGE602022) yang
> diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia
> pada Semester Gasal, Tahun Ajaran 2021/2022.

## 📱 Aplikasi 📱

Saat ini, hanya tersedia versi Android (APK) untuk diunduh. File APK dapat diunduh di bagian [_releases_](https://github.com/reflekt-io/echo/releases).

## 👨‍💻 Pengembang Aplikasi 👩‍💻

Proyek ini dibuat oleh kelompok C04 yang beranggotakan sebagai berikut.

- [Aurelia Amanda Robert](https://github.com/orelar) (2006527903)
- [Kevin](https://github.com/vnctkevin) (2006483795)
- [Loanda Gunawan](https://github.com/Gloanda) (2006521585)
- [Muhammad Athallah](https://github.com/determinedguy) (2006527481)
- [Muhammad Bintang Azriel Aditya Wardhana](https://github.com/bintangazriel) (2006536492)
- [Muhammad Fikri Haryanto](https://github.com/mfikriharyanto) (2006525053)
- [Teuku Faiz Aryasena](https://github.com/teukufaiz) (2006535716)

## 📋 Daftar Modul 📋

Berikut ini adalah daftar modul yang akan diimplementasikan beserta pengembang dari setiap modul.

- [Journaling](https://github.com/reflekt-io/echo/tree/main/journal) - [Muhammad Athallah](https://github.com/determinedguy)
- [Pojok Curhat](https://github.com/reflekt-io/echo/tree/main/pojok_curhat) - [Kevin](https://github.com/vnctkevin)
- [Tembok Harapan](https://github.com/reflekt-io/echo/tree/main/tembok_harapan) - [Teuku Faiz Aryasena](https://github.com/teukufaiz)
- [Kutipan Penyemangat](https://github.com/reflekt-io/echo/tree/main/kutipan) - [Aurelia Amanda Robert](https://github.com/orelar)
- [Deteksi Dini Depresi](https://github.com/reflekt-io/echo/tree/main/deteksi_depresi) - [Loanda Gunawan](https://github.com/Gloanda)
- [Ide Kegiatan untuk Perasaan yang Dirasakan](https://github.com/reflekt-io/echo/tree/main/ide_kegiatan) - [Muhammad Fikri Haryanto](https://github.com/mfikriharyanto)
- [About Us](https://github.com/reflekt-io/echo/tree/main/about_us) - [Muhammad Bintang Azriel Aditya Wardhana](https://github.com/bintangazriel)

## 🔗 Integrasi dengan Situs Web 🔗

Berikut adalah langkah-langkah yang akan dilakukan untuk mengintegrasikan aplikasi dengan server web.

1. Mengimplementasikan sebuah _wrapper class_ dengan menggunakan library _http_ dan _map_ untuk mendukung penggunaan _cookie-based authentication_ pada aplikasi.
2. Mengimplementasikan REST API pada Django (views.<area>py) dengan menggunakan JsonResponse atau Django JSON Serializer.
3. Mengimplementasikan desain _front-end_ untuk aplikasi berdasarkan desain website yang sudah ada sebelumnya.
4. Melakukan integrasi antara _front-end_ dengan _back-end_ dengan menggunakan konsep _asynchronous_ HTTP.

## 👥 Persona 👥

Aplikasi ini hanya dapat diakses setelah pengguna melakukan _login_. Apabila pengguna belum memiliki akun, maka pengguna dapat membuat akun melalui fitur _sign up_.

Pengguna yang sudah melakukan _login_ dapat:

- Melakukan Deteksi Dini Depresi
- Melakukan Journaling
- Menggunakan Pojok Curhat
- Melihat dan membuat Kutipan Penyemangat
- Menuliskan harapan pada Tembok Harapan
- Melihat Ide Kegiatan yang dapat dilakukan
- Melihat detail aplikasi dan memberikan saran kepada pengembang aplikasi melalui About Us

## 📑 Referensi 📑

Berikut ini adalah sumber referensi yang digunakan dalam pembuatan proyek ini.

- [Efektivitas Kuesioner PHQ-9 Sebagai Skrining Deteksi Dini Depresi](https://www.alomedika.com/efektivitas-kuesioner-ph-9-sebagai-skrining-deteksi-dini-depresi/)
- [The Patient Health Questionnaire (PHQ-9) - Overview](https://img3.reoveme.com/m/7dcac06741830f40.pdf)
- [Relax Color Scheme » Blue » SchemeColor.com](https://www.schemecolor.com/relax-color.php)
- [Beautiful Free Images & Pictures | Unsplash](https://unsplash.com)
- [How do I make an http request using cookies on flutter?](https://stackoverflow.com/questions/52241089/how-do-i-make-an-http-request-using-cookies-on-flutter)
- [Using Github Actions With Flutter](https://petercoding.com/flutter/2021/07/18/using-github-actions-with-flutter/)
- [Flutter Action](https://github.com/subosito/flutter-action)
- [GitHub Release Action](https://github.com/ncipollo/release-action)
- [How to handle screen transitions in Flutter - Tetsuhiro Ueda](https://medium.com/@najeira/how-to-handle-screen-transitions-in-flutter-b39dcb2675f)
- [App Icon Generator](https://appicon.co/)
- [How to implement Authentication in TK2 PBP - Adrian Ardizza](https://gist.github.com/Meta502/1605fdba3b141fbf67dba689e9e55498)
- [Flutter Android App Distribution with Visual Studio AppCenter](https://itnext.io/flutter-android-app-distribution-with-visual-studio-appcenter-1b94f3ee8fd1)
- [Using AppCenter for Flutter projects](https://rocksolidknowledge.com/articles/using-appcenter-for-flutter-projects)
- [Deploy Flutter Apps using AppCenter](https://medium.com/@maite.daluz11/deploy-flutter-apps-using-appcenter-ec28e8d940bf)
