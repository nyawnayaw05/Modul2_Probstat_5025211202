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

Tabel dibuat terlebih dahulu 
```R
sebelum <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
sesudah <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
```
Mendapatkan standar variasi sebelum dan sesudah aktivitas
```R
sd(sebelum)
sd(sesudah)
```
Hasil dari sd sebelum = 3.865805
Hasil dari sd sesudah = 8.833333

Mendapatkan selisih standar deviasi
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
- Nilai probabilitas yang didapat dari uji t(p-value) adalah 6.003e-05. Sehingga nilai p-value lebih kecil dibandingkan nilai significant level yang nilainya 𝛼 = 0,05. Oleh karena itu, hipotesis nol ditolak dan hipotesis alternatif diterima.

- Kesimpulan : Terdapat pengaruh yang signifikan secara statistika dalam hal jumlah denyut jantung, sebelum dan sesudah mengkonsumsi obat 𝐴 pada tingkat signifikansi 5%.

## Nomor 2 (Hipotesa 1 Sampel)
>> Diketahui bahwa mobil dikemudikan rata - rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukan rata - rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul).

### 2A
Apakah anda setuju dengan klaim tersebut?
- Sebelum dilakukannya pembuktian saya setuju dengan klaim tersebut.
- Setelah pembuktian pun benar adanya bahwa klaim itu dapat diterima.

### 2B 
Jelaskan maksud dari output yang dihasilkan!
- Output yang dihasilkan adalah nilai z = 8.9744, p-value < 2.2e-16, hipotesis alternatif > 20000, dan confidence interval = 22858.51 menggunakan fungsi di bawah ini :

```R
klaim_mean <- 20000
n <- 100
sampel_mean <- 23500
sd_populasi <-3900

zsum.test(mean.x = sampel_mean, sigma.x = sd_populasi, 
        n.x = n, alternative = "greater", mu = klaim_mean)
```

![image](https://user-images.githubusercontent.com/114491445/207137763-3c9da962-72b4-4ca1-a32a-1e9f65c802ce.png)

### 2C
Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

Kesimpulan : Nilai P-Value lebih kecil dari nilai significant level 𝛼 = 0,05. Sehingga hipotesis nol ditolak sedangkan hipotesis alternatif diterima. Jadi klaim bahwa mobil dikemudikan rata - rata lebih dari 20000 kilometer per tahun dapat diterima.

## Nomor 3 (Hipotesa 2 Sampel) 
>>Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

| Nama Kota/Atribut       |     Bandung   |   Bali    |
|  ---                    |     ---       |   ---     |
| Jumlah Saham            |       19      |    27     |
| Sampel Mean             |       3.64    |    2.79   |
| Sampel Standar Deviasi  |       1.67    |    1.32   |

>> Dari data di atas berilah keputusan serta kesimpulan yang didapatkan dari hasil di atas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata - ratanya (α= 0.05)? Buatlah:

### 3A
H0 dan H1 
> H0 : μ1 = μ2
> H1 : μ1 != μ

H0 = tidak terdapat perbedaan signifikan antara rata-rata kedua kota
H1 = terdapat perbedaan signifikan antara rata-rata kedua kota

### 3B
Hitung Sampel Statistik!
```R
n1 <- 19
n2 <- 27
x1 <- 3.64
x2 <- 2.79
sigma1 <- 1.67
sigma2 <- 1.32
```
Menggunakan
```R
s_pool <- (((n1 - 1)*(sigma1^2) + (n2 - 1)
        *(sigma2^2))/(n1 + n2 -2))^0.5
s_pool
```
![image](https://user-images.githubusercontent.com/114491445/207156444-748b5302-f734-4d98-83af-d75ffc2f321c.png)
Hasil sampel statistik = 1.473266

### 3C 
Lakukan Uji Statistik (df = 2)!

Menggunakan :
```R
tsum.test (mean.x = x1, s.x = sigma1, n.x = n1, 
           mean.y = x2, s.y = sigma2, n.y = n2,
           alternative = "two.sided", var.equal =  TRUE)
```
![image](https://user-images.githubusercontent.com/114491445/207156693-213221ce-deb1-4744-8cad-ca11ce5930b3.png)
Hasil yang didapat adalah t = 1.9267 dan p-value = 0.06049

### 3D
Niliai Kritikal 

Menggunakan :
```R
qchisq(p = 0.05, df = 2, lower.tail = FALSE)
```

![image](https://user-images.githubusercontent.com/114491445/207156829-b043dfbc-0f03-4326-a24f-6083f8472263.png)

Sehingga didapat 
- Nilai kritikal atas =  5.991465
- Nilai kritikal bawah = -5.991465 

### 3E
Keputusan 

>H0 diterima

- Karena t berada di antara nilai kritikal bawah dan nilai kritikal atas (Berada di area not reject)
- P-Value = 0.06049 lebih besar daripada nilai significant level (𝛼 = 0,05)

### 3F
Kesimpulan 
Berdasarkan keputusan diatas dapat diambil kesimpulan yaitu tidak terdapat perbedaan atara rata-rata Kota Bandung dan Bali

## Nomor 4 (Anova Satu Arah)
>> Seorang peneliti sedang meneliti spesies dari kucing di ITS. Dalam penelitiannya ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing - masing.

>>Jika :
Diketahui data set : https://intip.in/datasetprobstat1
H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata - rata panjangnya sama

>>Maka Kerjakan atau Carilah :
### 4A
Buatkanlah masing - masing jenis spesies menjadi 3 subjek "Grup" (grup 1, grup 2, grup 3). Lalu gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

Memasukan data menggunakan fungsi ini :
```R
dataKucing <- read.table(url(
    "https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/  onewayanova.txt"),h=T)
attach(dataKucing)
names(dataKucing)
```

Lalu plot kuantil normal akan digambar menggunakan fungsi di bawah ini :
```R
dataKucing$Group <- as.factor(dataKucing$Group)
dataKucing$Group = factor(dataKucing$Group,labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(dataKucing$Group)

Group1 <- subset(dataKucing, Group == "Kucing Oren")
Group2 <- subset(dataKucing, Group == "Kucing Hitam")
Group3 <- subset(dataKucing, Group == "Kucing Putih")

qqnorm(Group1$Length)
qqline(Group1$Length, col = "orange")

qqnorm(Group2$Length)
qqline(Group2$Length, col = "black")

qqnorm(Group3$Length)
qqline(Group3$Length, col = "red")
```
<b> Plot Kucing Oren </b>

![image](https://user-images.githubusercontent.com/114491445/207306624-c7238c4e-f850-45a8-9a09-47145095e12c.png)

<b> Plot Kucing Hitam </b>

![image](https://user-images.githubusercontent.com/114491445/207306776-79465ffc-2162-4b19-8883-4e7dec4968de.png)

<b> Plot Kucing Putih </b>

![image](https://user-images.githubusercontent.com/114491445/207306913-b777e9a3-515c-4252-9e7a-4bf9b5905476.png)

### 4B
Carilah atau periksalah Homogeneity of variance nya, berapa nilai p yang didapatkan? Apa hipotesis dan kesimpulan yang dapat diambil?
> H0 : Variansi ketiga populasi sama
H1 : Ada variansi yang berbeda diantara ketiga populasi

P-Value di dapat menggunakan fungsi di bawah ini :
```R
bartlett.test(Length ~ Group, data = dataKucing)
```

![image](https://user-images.githubusercontent.com/114491445/207307020-81ae4a8e-536a-4978-9f0a-8a28a0c1ac6a.png)

P-Value = 0.8054

- Hipotesis nol diterima karena p-value lebih besar dari nilai significant level (𝛼 = 0,05). 

- Kesimpulan yang dapat diambil dari keputusan di atas adalh variansi ketiga populasi sama.

### 4C 
Untuk uji ANOVA, buatlah model linier dengan panjang versus grup dan beri nama model tersebut model 1.

```R
model1 = lm(Length ~ Group, data = dataKucing)
anova(model1)
```
![image](https://user-images.githubusercontent.com/114491445/207307210-e024396a-7bbb-4c5c-9f54-4b9870ab0481.png)

### 4D
Dari hasil poin C, berapakah nilai-p? Apa yang dapat anda simpulkan dari H0?

- P-Value dari uji ANOVA adalah 0,0013. P-Value tersebut lebih kecil dari nilai significant level (𝛼 = 0,05). Oleh karena itu hipotesis nol ditolak sedangkan hipotesis alternatif diterima.
- Kesimpulan : Ada nilai variansi yang berbeda diantara ketiga populasi

### 4E
Verifikasilah jawaban model 1 dengan Post-Hooc test TukeyHSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

```R
TukeyHSD(aov(model1))
```

![image](https://user-images.githubusercontent.com/114491445/207307407-4e19452f-beaf-4ec8-9584-a9adb87dc36a.png)

Jika perbandingan spesies memiliki nilai p>0.05, maka secara statistik kedua spesies memiliki panjang yang sama. Sedangkan P<0.05, maka spesies berbeda. Terlihat dari hasil pada tabel hasil kucing putih dan kucing oren memiliki panjang sama p=0.8726158. Sedangkan kucing hitam berbeda dari keduanya. Melalui tabel selisih (diff), ditemukan bahwa kucing hitam lebih pendek daripada kucing putih dan oren

Kesimpulan : terdapat nilai variansi yang berbeda diantara ketiga populasi. Hal ini sesuai dengan Post-hooc test TukeyHSD yang membuktikan bahwa panjang kucing hitam berbeda dari kucing putih dan kucing oren

### 4F
Visualisasikan data dengan ggplot2
```R
library("ggplot2")
ggplot(dataKucing, aes(x = Group, y = Length)) +
  geom_boxplot(fill = "red", colour = "black") +
  scale_x_discrete() + xlab("Treatment Group") +
  ylab("Cat Length")
```

![image](https://user-images.githubusercontent.com/114491445/207307546-12c2091a-40f3-4c79-bbdf-6721c77a1dec.png)

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
