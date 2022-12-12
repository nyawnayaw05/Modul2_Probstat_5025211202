# Praktikum-2-Probstat
Praktikum 2 Probstat Glenaya (5025211202)

## Nomor 1
>> Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴 

| Responden |      X    |  Y  |
| ---       |   ---     |---  |
|     1     |     78    | 100 |
|     2     |     75    |  95 |
|     3     |     67    |  70 |
|     4     |     77    |  90 |
|     5     |     70    |  90 |
|     6     |     72    |  90 |
|     7     |     78    |  89 |
|     8     |     74    |  90 |
|     9     |     77    | 100 |

>> Berdasarkan data pada tabel di atas, diketahui kadar saturasi oksigen dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 70.

### 1.A
Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel di atas!

![image](https://user-images.githubusercontent.com/114491445/207117835-ef3fe26f-eb5d-47e1-90f9-dfe36e9134f6.png)

>Tabel dibuat terlebih dahulu 
```R
sebelum <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
sesudah <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
```
>Mendapatkan standar variasi sebelum dan sesudah aktivitas
```R
sd(sebelum)
sd(sesudah)
```
Hasil dari sd sebelum = 3.865805
Hasil dari sd sesudah = 8.833333
>Mendapatkan selisih standar deviasi
```R
sd(sebelum - sesudah)
```
Hasil selisih dari standar deviasi = 6.359595


### 1.B
Carilah nilai t (p-value)

![image](https://user-images.githubusercontent.com/114491445/207118000-7caf01a6-d7e0-4a74-b24d-9dcbdf409712.png)

```R
t.test(sebelum, sesudah, paired = TRUE)
```
Nilai dari t(p-value) = 6.003e-05

### 1.C 
Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : "tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴"
>Nilai probabilitas yang didapat dari uji t(p-value) adalah 6.003e-05. Sehingga nilai p-value lebih kecil dibandingkan nilai significant level yang nilainya 𝛼 = 0,05. Oleh karena itu, hipotesis nol ditolak dan hipotesis alternatif diterima.

>Kesimpulan : Terdapat pengaruh yang signifikan secara statistika dalam hal jumlah denyut jantung, sebelum dan sesudah mengkonsumsi obat 𝐴 pada tingkat signifikansi 5%.

## Nomor 2 (Hipotesa 1 Sampel)
>> Diketahui bahwa mobil dikemudikan rata - rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukan rata - rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul).

### 2A
Apakah anda setuju dengan klaim tersebut?
> Sebelum dilakukannya pembuktian saya setuju dengan klaim tersebut karena saat dilihat sekilas.

### 2B 
Jelaskan maksud dari output yang dihasilkan!
> Output yang dihasilkan adalah nilai z = 8.9744, p-value < 2.2e-16, hipotesis alternatif > 20000, dan confidence interval = 22858.51 menggunakan fungsi di bawah ini :

```R
klaim_mean <- 20000
n <- 100
sampel_mean <- 23500
sd_populasi <-3900

zsum.test(mean.x = sampel_mean, sigma.x = sd_populasi, 
        n.x = n, alternative = "greater", mu = klaim_mean)
```

### 2C
Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
> Kesimpulan : Nilai P-Value lebih kecil dari nilai significant level 𝛼 = 0,05. Sehingga hipotesis nol ditolak sedangkan hipotesis alternatif diterima. Jadi klaim bahwa mobil dikemudikan rata - rata lebih dari 20000 kilometer per tahun dapat diterima.

## Nomor 3 (Hipotesa 2 Sampel) 
>> Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

| Nama Kota/Atribut       |     Bandung   |   Bali    |
|  ---                    |     ---       |   ---     |
| Jumlah Saham            |       19      |    27     |
| Sampel Mean             |       3.64    |    2.79   |
| Sampel Standar Deviasi  |       1.67    |    1.32   |

>> Dari data di atas berilah keputusan serta kesimpulan yang didapatkan dari hasil di atas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata - ratanya (α= 0.05)? Buatlah:

### 3A
H0 dan H1 (3)

### 3B
Hitung Sampel Statistik (3)

### 3C 
Lakukan Uji Statistik (df = 2) (5)

### 3D
Niliai Kritikal (3)

### 3E
Keputusan (3)

### 3F
Kesimpulan (3)

## Nomor 4 (Anova Satu Arah)
>> Seorang peneliti sedang meneliti spesies dari kucing di ITS. Dalam penelitiannya ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing - masing.

Jika :
Diketahui data set : https://intip.in/datasetprobstat1
H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata - rata panjangnya sama

Maka Kerjakan atau Carilah :
### 4A
Buatkanlah masing - masing jenis spesies menjadi 3 subjek "Grup" (grup 1, grup 2, grup 3). Lalu gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

### 4B
Carilah atau periksalah Homogeneity of variance nya, berapa nilai p yang didapatkan? Aapa hipotesis dan kesimpulan yang dapat diambil?

### 4C 
Untuk uji ANOVA, buatlah model linier dengan panjang versus grup dan beri nama model tersebut model 1.

### 4D
Dari hasil poin C, berapakah nilai-p? Apa yang dapat anda simpulkan dari H0?

### 4E
Verifikasilah jawaban model 1 dengan Post-Hooc test TukeyHSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

### 4F
Visualisasikan data dengan ggplot2

## Nomor 5 (Anova Dua Arah) 
>> Data yang digunakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B, dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut : 
https://drive.google.com/file/d/1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ/view?usp=sharing. Dengan data tersebut :
## 5A
Buatlah plot sederhana untuk visualisasi data!

## 5B
Lakukan uji ANOVA dua arah untuk 2 faktor

## 5C
Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

## 5D
Lakukan uji Tukey!

## 5E
Gunakan compact letter displat untuk menunjukkan perbedaan signifikan antara uji ANOVA dan uji Tukey!
