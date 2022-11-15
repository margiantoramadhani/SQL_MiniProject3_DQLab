### Fundamental SQL Using INNER JOIN and UNION
Source : https://academy.dqlab.id/main/package/practice/244?pf=0

----

#### Sample of Dataset Project

<details>
<summary markdown="span">ms_pelanggan</summary>

| no_urut | kode_pelanggan | nama_customer      | alamat                                 |
|---------|----------------|--------------------|----------------------------------------|
|       1 | dqlabcust01    | Eva Novianti, S.H. | Vila Sempilan, No. 67 - Kota B         |
|       2 | dqlabcust02    | Heidi Goh          | Vila Sempilan, No. 11 - Kota B         |
|       3 | dqlabcust03    | Unang Handoko      | Vila Sempilan, No. 1 - Kota B          |
|       4 | dqlabcust04    | Jokolono Sukarman  | Vila Permata Intan Berkilau, Blok C5-7 |
|       5 | dqlabcust05    | Tommy Sinaga       | Vila Permata Intan Berkilau, Blok A1/2 |

</details>

<details>
<summary markdown="span">tr_penjualan</summary>

| kode_transaksi | kode_pelanggan | no_urut | kode_produk | nama_produk               | qty  | harga  |
|----------------|----------------|---------|-------------|---------------------------|------|--------|
| tr-001         | dqlabcust07    |       1 | prod-01     | Kotak Pensil DQLab        |    5 |  62500 |
| tr-001         | dqlabcust07    |       2 | prod-03     | Flash disk DQLab 32 GB    |    1 | 100000 |
| tr-001         | dqlabcust07    |       3 | prod-09     | Buku Planner Agenda DQLab |    3 |  92000 |
| tr-001         | dqlabcust07    |       4 | prod-04     | Flashdisk DQLab 32 GB     |    3 |  40000 |
| tr-002         | dqlabcust01    |       1 | prod-03     | Gift Voucher DQLab 100rb  |    2 | 100000 |

</details>

<details>
<summary markdown="span">ms_produk_1</summary>

| no_urut | kode_produk | nama_produk              | harga  |
|---------|-------------|--------------------------|--------|
|       1 | prod-01     | Kotak Pensil DQLab       |  62500 |
|       2 | prod-02     | Flashdisk DQLab 64 GB    |  55000 |
|       3 | prod-03     | Gift Voucher DQLab 100rb | 100000 |
|       4 | prod-04     | Flashdisk DQLab 32 GB    |  40000 |
|       5 | prod-05     | Gift Voucher DQLab 250rb | 250000 |

</details>

<details>
<summary markdown="span">ms_produk_2</summary>

| no_urut | kode_produk | nama_produk                        | harga |
|---------|-------------|------------------------------------|-------|
|       6 | prod-06     | Pulpen Multifunction + Laser DQLab | 92500 |
|       7 | prod-07     | Tas Travel Organizer DQLab         | 48000 |
|       8 | prod-08     | Gantungan Kunci DQLab              | 15800 |
|       9 | prod-09     | Buku Planner Agenda DQLab          | 92000 |
|      10 | prod-10     | Sticky Notes DQLab 500 sheets      | 55000 |

</details>

----

#### Project INNER JOIN
Dalam database, terdapat tabel ms_pelanggan yang berisi data - data pelanggan yang membeli produk dan tabel tr_penjualan yang berisi data transaksi pembelian di suatu store.</br>
Suatu hari, departemen marketing & promotion meminta bantuan untuk meng-query data-data pelanggan yang membeli produk Kotak Pensil DQLab, Flashdisk DQLab 32 GB, dan Sticky Notes DQLab 500 sheets.</br>
Buatlah query menggunakan tabel ms_pelanggan dan tr_penjualan untuk mendapatkan data - data yang diminta oleh marketing yaitu kode_pelanggan, nama_customer, alamat.</br>
NB: Gunakan SELECT DISTINCT untuk menghilangkan duplikasi, jika diperlukan.

```sql
select distinct
  ms_pelanggan.kode_pelanggan, 
  ms_pelanggan.nama_customer, 
  ms_pelanggan.alamat
from 
  ms_pelanggan
inner join 
  tr_penjualan
  on 
  ms_pelanggan.kode_pelanggan = tr_penjualan.kode_pelanggan
where 
  tr_penjualan.nama_produk = 'Kotak Pensil DQLab' or 
  tr_penjualan.nama_produk = 'Flashdisk DQLab 32 GB' or
  tr_penjualan.nama_produk = 'Sticky Notes DQLab 500 sheets';
```

<details>
<summary markdown="span">OUTPUT :</summary>

| kode_pelanggan | nama_customer      | alamat                                 |
|----------------|--------------------|----------------------------------------|
| dqlabcust01    | Eva Novianti, S.H. | Vila Sempilan, No. 67 - Kota B         |
| dqlabcust03    | Unang Handoko      | Vila Sempilan, No. 1 - Kota B          |
| dqlabcust05    | Tommy Sinaga       | Vila Permata Intan Berkilau, Blok A1/2 |
| dqlabcust07    | Agus Cahyono       | Vila Gunung Seribu, Blok F4 - No. 8    |

</details>

----

#### Project UNION
Persiapkanlah data katalog mengenai mengenai nama - nama produk yang akan dijual di suatu store. Data tersebut akan digunakan dalam meeting untuk mereview produk mana saja yang akan dilanjutkan penjualannya dan mana yang tidak akan dilanjutkan.</br>
Siapkan hanya data produk dengan harga di bawah 100K untuk kode produk prod-1 sampai prod-5; dan dibawah 50K untuk kode produk prod-6 sampai prod-10, tanpa mencantumkan kolom no_urut.

```sql
select 
  nama_produk, 
  kode_produk, 
  harga
from 
  ms_produk_1
where 
  harga < 100000
union
select 
  nama_produk, 
  kode_produk, 
  harga
from 
  ms_produk_2
where 
  harga < 50000;
```

<details>
<summary markdown="span">OUTPUT :</summary>

| nama_produk                | kode_produk | harga |
|----------------------------|-------------|-------|
| Kotak Pensil DQLab         | prod-01     | 62500 |
| Flashdisk DQLab 64 GB      | prod-02     | 55000 |
| Flashdisk DQLab 32 GB      | prod-04     | 40000 |
| Tas Travel Organizer DQLab | prod-07     | 48000 |
| Gantungan Kunci DQLab      | prod-08     | 15800 |

</details>
