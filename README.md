# SoalShiftSISOP20_modul1_F02
Praktikum Modul 1 Sisop 2020

Kelompok F02 (0099 &amp; 0142)

# Pembahasan Jawaban

## No 1 AWK - Data Sample-SuperStore.tsv

### Source Code : [1A](https://github.com/rifkiirawan/SoalShiftSISOP20_modul1_F02/blob/master/Soal-1/soal1a.sh)

```bash
#!/bin/bash
awk -F "\t" 'NR>1 {a[$13]+=$21;}END{min=1000000; for(i in a) {if(min > a[i]) {min=a[i]; place=i;}} print place", "min;}' Sample-Superstore.tsv

```
A. Menentukan region mana yang memiliki profit paling sedikit.

Karena soal merupakan pengolahan data maka menggunakan awk untuk menyelesaikannya.

-F digunakan untuk separator atau pemisah antar kolom yang diubah menjadi tab "\t" karena pada defaultnya adalah spasi.

NR>1 agar judul kolom tidak ikut diolah.

`a[$13]+=$21` untuk menjumlahkan profit berdasarkan region yang sama (seperti group by region). Kemudian dicari minimalnya dengan perulangan for sebanyak array a, dengan kondisi yang paling kecil dan di print region dan profit minimalnya.

### Source Code : [1B](https://github.com/rifkiirawan/SoalShiftSISOP20_modul1_F02/blob/master/Soal-1/soal1b.sh)

```bash
#!bin/bash
awk -F "\t" 'NR>1 {if( $13=="Central" ) { a[$11]+=$21 }} END { for(i in a) print i","a[i] | "sort -t ',' -g -k2"}' Sample-Superstore.tsv | head -n 2

```
B. Menampilkan 2 state yang memiliki profit paling sedikit berdasarkan jawaban soal a.

`if( $13=="Central" )` Sebelum memulai operasi apapun, diberi kondisi bahwa hanya Region Central yang akan diolah.

`a[$11]+=$21` untuk menjumlahkan profit berdasarkan state yang sama (seperti group by state).

`sort -t ',' -g -k2` untuk mengurutkan `sort` angka desimal dari yang terkecil ke terbesar `-g` dengan pemisah separator koma `-t ','` yang ada di kolom kedua `-k2`. Kolom kedua diambil dari perulangan sebelumnya yaitu a[i] yang adalah profit.

`head -n 2` untuk menampilkan 2 data teratas.

### Source Code : [1C](https://github.com/rifkiirawan/SoalShiftSISOP20_modul1_F02/blob/master/Soal-1/soal1c.sh)

```bash
!bin/bash
awk -F "\t" 'NR>1 { if( ( $11=="Illinois" || $11=="Texas" ) && $13=="Central" ) { a[$17]+=$21; }} END { for(i in a) print i"="a[i] | "sort -t '=' -g -k2" }' Sample-Superstore.tsv | head -n 10

```
C. Menampilkan 10 produk yang memiliki profit paling sedikit berdasarkan jawaban soal b.

Hampir sama dengan penjelasan 1B hanya saja terdapat sedikit perbedaan yaitu:

`if( ( $11=="Illinois" || $11=="Texas" ) && $13=="Central" )` Kondisi yang diproses adalah produk yang berasal dari state Texas atau Illinois dan dengan Region Central (jawaban 1A).

`sort -t '=' -g -k2` Separator yang digunakan adalah `=` karena pada product terdapat penggunaan tanda koma yang dapat mengacaukan pengolahan datanya.

`head -n 10` untuk menampilkan 10 data teratas.

## No 2 Bash Script

### Source Code :  [2A&B](https://github.com/rifkiirawan/SoalShiftSISOP20_modul1_F02/blob/master/Soal-2/makepass.sh)

```bash
#! /bin/bash
pass=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c28 | head -n 1)

while true; do
if [[ $1 =~ ^[A-Za-z]+$ ]];then
	file="$1.txt"
	echo "$pass" > "$file"
	break
	else
	echo "HURUF ONLY"
	break
	fi
done
```

A. Membuat sebuah password acak yang terdapat huruf besar, huruf kecil, dan angka sebanyak 28 karakter.

`pass=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c28 | head -n 1)` merupakan salah satu codingan yang mengimplementasikan "Caesar Cipher, yang memiliki fungsi untuk menghasilkan sebuah string yang berisi 28 karakter yang berisi huruf besar, huruf kecil, dan angka.

B. Menyimpan nama file pada sebuah file berekstensi .txt yang diberi nama berdasarkan argumen yang diinputkan hanya berupa alfabet.

`while true; do
if [[ $1 =~ ^[A-Za-z]+$ ]];then
	file="$1.txt"
	echo "$pass" > "$file"
	break
	else
	echo "HURUF ONLY"
	break
	fi
done` di dalam state if tersebut akan dilakukan pengecekan apakah nama file tersebut berupa alfabet atau bukan, jika berupa alfabet, maka akan menyimpan nama file tersebut, jika bukan, maka akan mengeluarkan pernyataan "HURUF ONLY"


### Source Code :  [2C]https://github.com/rifkiirawan/SoalShiftSISOP20_modul1_F02/blob/master/Soal-2/soal2_coba.sh

```bash
#!/bin/bash

before=$1

jam=`date "+%H"`

while [ $jam -gt 0 ]
do
 after=$(echo $before | tr '[A-Za-z]' '[B-ZAb-za]')
 jam=$((jam-1))
done

mv $before.txt $after.txt
```

C. Nama file tersebut akan di enkripsi menggunakan string manipulation yang disesuaikan oleh jam file tersebut dibuat.
`date "+%H"` untuk mengambil value jam saat ini.

`while [ $jam -gt 0 ]
do
 after=$(echo $before | tr '[A-Za-z]' '[B-ZAb-za]')
 jam=$((jam-1))
done`
untuk melakukan looping sesuai jam saat ini, dan nama file akan digeser karakternya sesuai jam-nya.

`mv $before.txt $after.txt` untuk mengubah nama file menjadi yang sudah di enkripsikan.

### Source Code :  [2D]https://github.com/rifkiirawan/SoalShiftSISOP20_modul1_F02/blob/master/Soal-2/soal2_wadaw.sh

```bash
#!/bin/bash

after="${1%.*}"

jam=$(date +%H -r $1)

while [ $jam -gt 0 ]
do
 before=$(echo $after | tr '[B-ZAb-za]' '[A-Za-z]')
 jam=$((jam-1))
done

mv $after.txt $before.txt
```

D. Men-decrypt nama file menjadi nama file semula.

`(date +%H -r $1)` untuk mendapatkan nilai di jam berapa file tersebut di encrypt.

`while [ $jam -gt 0 ]
do
 before=$(echo $after | tr '[B-ZAb-za]' '[A-Za-z]')
 jam=$((jam-1))
done`
lalu akan dilakukan pergeseran tiap karakter pada nama file yang semula di encrypt, menjadi di decrypt sesuai dengan jam terakhir file tersebut di modified. 

`mv $after.txt $before.txt` untuk mengubah nama file menjadi yang sudah di dekripsikan.

## No 3 Bash, AWK, Crontab

### Source Code : [3A](https://github.com/rifkiirawan/SoalShiftSISOP20_modul1_F02/blob/master/Soal-3/soal3a.sh)

```bash
!/bin/bash
for i in {1..28}
do
	wget "https://loremflickr.com/320/240/cat" -O "/home/evelyn/Praktikum1/pdkt_kusuma_$i" -a "/home/evelyn/Praktikum1/wget.log"
done

```
A. Mendownload 28 gambar dari https://loremflickr.com/320/240/cat menggunakan command wget dan menyimpan file
dengan nama "pdkt_kusuma_NO" serta menyimpan log messages wget kedalam sebuah file "wget.log".

`for i in {1..28}` untuk perulangan sebanyak 28 kali.

`wget "https://loremflickr.com/320/240/cat"` untuk mendownload dari url yang dicantumkan.

`-O "/home/evelyn/Praktikum1/pdkt_kusuma_$i"` -O digunakan untuk menyimpan file yang didownload dengan nama sesuai dengan yang diinginkan. Nomor yang digunakan pada pdkt_kusuma_Nomor diambil dari perulangan sebelumnya.

`-a "/home/evelyn/Praktikum1/wget.log"` -a untuk menyimpan hasil outpun dari download yang seharusnya tampil di terminal tetapi dipindahkan dan disimpan di wget.log.

### Source Code : [3B](https://github.com/rifkiirawan/SoalShiftSISOP20_modul1_F02/blob/master/Soal-3/crontab)

```bash
5 6-23/8 * * 1-5,7 /bin/bash /home/evelyn/Praktikum1/soal3a.sh

```
B. Menjalankan program jawaban a pada setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu

Pertama ketik crontab -e pada terminal untuk membuka crontab, kemudian diisi dengan source code diatas.

`5 6-23/8 * * 1-5,7` artinya pada menit ke 5 mulai jam 6-23.00 setiap 8 jam pada hari senin sampai jumat dan sabtu.

`/bin/bash` menggunakan absolute path karena crontab tidak berjalan di folder yang sama dengan bash yang dijalankan.

`/home/evelyn/Praktikum1/soal3a.sh` alamat script yang dijalankan.

### Source Code : [3C](https://github.com/rifkiirawan/SoalShiftSISOP20_modul1_F02/blob/master/Soal-3/soal3c.sh)

```bash
#!/bin/bash

grep "Location" wget.log > location.log
readarray myarray < location.log

for i in {1..28}
do
	for j in {1..28}
	do
		if [ $i -eq $j ]
		then
			continue
		elif [ "${myarray[$i]}" = "${myarray[$j]}" ]
		then
			mv pdkt_kusuma_$i ./duplicate/duplicate_$i
		fi
	done
done
for i in {1..28}
do
	mv pdkt_kusuma_$i ./kenangan/kenangan_$i
done
cp wget.log wget.log.bak

```
C. Mengidentifikasi gambar yang didownload, bila identik sisakan 1 gambar dan lainnya dimasukkan ke folder duplicate dengan nama duplicate_nomor, sisanya masukkan semua gambar ke dalam folder kenangan dengan nama kenangan_nomor. Kemudian back up log menjadi file berekstensi .log.bak.

`grep "Location" wget.log > location.log` untuk mencari kata Location dan memasukkan satu baris ke location.log

`readarray myarray < location.log` untuk memasukkan list di location.log ke dalam array

Untuk pengecekan seluruh gambar, maka dibuat nested for 28 kali 28 agar semua gambar dapat dicompare.

`if [ $i -eq $j ]` Jika sebuah gambar dicompare dengan gambar itu sendiri maka pasti akan sama, sehingga harus dilewatkan.

`elif [ "${myarray[$i]}" = "${myarray[$j]}" ]"` Untuk memeriksa apakah gambar tersebut sama dengan gambar pembandingnya, dengan membandingkan string location pada array.

`mv pdkt_kusuma_$i ./duplicate/duplicate_$i` pemindahan (move) file pdkt_kusuma_nomorgambar ke dalam folder duplicate dengan rename duplicate_nomorgambaryangsama. Demikian juga pada `./kenangan/kenangan_$i`.

`cp wget.log wget.log.bak` men-copy wget.log yang isinya output wget ke dalam wget.log.bak sebagai back up.

## Authors

Created by:

[Rifki Aulia Irawan 142] (https://github.com/rifkiirawan)

[Evelyn Tjitrodjojo 99] (https://github.com/marsellaeve)
