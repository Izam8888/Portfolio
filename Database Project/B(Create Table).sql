/* Kelompok 1
Anggota Kelompok:
2301855034 - James Bezaliel Jonathan
2301859511 - Alvin Briandy Chea
2301861882 - Kendrew Gain Widjaja
2301950710 - Muhammad Hizam Al Ibrahim
*/

create database TStore
drop database TStore 
use TStore

-- B: Create Table

create table MsStaff(
StaffID char(5) primary key check(StaffID like 'ST[0-9][0-9][0-9]'),
StaffName varchar(255) not null,
StaffAddress varchar(255) not null,
StaffPhoneNum varchar(11) check(StaffPhoneNum like '08[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
StaffGender varchar(10) not null,
StaffEmail varchar(50) not null,
StaffSalary int check(StaffSalary >= 3000000) not null
) 

create table MsCategory(
CategoryID char(5) primary key check(CategoryID like 'CA[0-9][0-9][0-9]'),
CategoryName varchar(255) not null
)

create table MsCustomer(
CustomerID char(5) primary key check(CustomerID like 'CU[0-9][0-9][0-9]'),
CustomerName varchar(255) not null,
CustomerAddress varchar(255) not null,
CustomerPhoneNumber varchar(11) check(CustomerPhoneNumber like '08[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
CustomerGender varchar(10) not null,
CustomerEmail varchar(50) not null
)

create table MsVendor(
VendorID char(5) primary key check(VendorID like 'VE[0-9][0-9][0-9]'),
VendorName varchar(255) not null,
VendorAddress varchar(255) not null,
VendorPhoneNumber varchar(11) check(VendorPhoneNumber like '08[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
VendorEmail varchar(50) not null
)

create table MsCloth(
ClothID char(5) primary key check(ClothID like 'CL[0-9][0-9][0-9]'),
CategoryID char(5) foreign key references MsCategory(CategoryID),
ClothBrand varchar(255) check(len(ClothBrand) >5) not null,
ClothPrice int check(ClothPrice >=20000) not null,
ClothStock int not null
)

create table HeaderPurchaseTransaction(
PurchaseTransactionID char(5) primary key check(PurchaseTransactionID like 'PU[0-9][0-9][0-9]'),
StaffID char(5) foreign key references MsStaff(StaffID),
VendorID char(5) foreign key references MsVendor(VendorID),
PurchaseDate date check(datediff(hour,PurchaseDate,getdate()) >= 1) not null
)

create table HeaderSalesTransaction(
SalesTransactionID char(5) primary key check(SalesTransactionID like 'SA[0-9][0-9][0-9]'),
StaffID char(5) foreign key references MsStaff(StaffID),
CustomerID char(5) foreign key references MsCustomer(CustomerID),
SalesDate date check(datediff(hour,SalesDate,getdate()) >= 1) not null
)

create table DetailPurchaseTransaction(
PurchaseTransactionID char(5),
ClothID char(5),
primary key(PurchaseTransactionID, ClothID),
foreign key(PurchaseTransactionID) references HeaderPurchaseTransaction,
foreign key(ClothID) references MsCloth,
QtyEachCloth int not null
)


create table DetailSalesTransaction(
SalesTransactionID char(5),
ClothID char(5),
primary key(SalesTransactionID, ClothID),
foreign key(SalesTransactionID) references HeaderSalesTransaction,
foreign key(ClothID) references MsCloth,
QtyEachCloth int not null
)