/* Kelompok 1
Anggota Kelompok:
2301855034 - James Bezaliel Jonathan
2301859511 - Alvin Briandy Chea
2301861882 - Kendrew Gain Widjaja
2301950710 - Muhammad Hizam Al Ibrahim
*/

use TStore

-- 4: Simulate Transaction
begin tran

insert into HeaderPurchaseTransaction
values
('PU021','ST010','VE010','2020-10-21 21:00:00')

insert into DetailPurchaseTransaction
values
('PU021','CL010','3')

rollback

begin tran

insert into HeaderSalesTransaction
values
('SA021','ST010','CU010','2020-11-21 21:00:00')

insert into DetailSalesTransaction
values
('SA021','CL010','4')

rollback
commit