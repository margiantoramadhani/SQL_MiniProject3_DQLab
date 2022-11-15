#Project INNER JOIN

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
  
#Project UNION

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