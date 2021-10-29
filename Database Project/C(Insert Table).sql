/* Kelompok 1
Anggota Kelompok:
2301855034 - James Bezaliel Jonathan
2301859511 - Alvin Briandy Chea
2301861882 - Kendrew Gain Widjaja
2301950710 - Muhammad Hizam Al Ibrahim
*/

use TStore

-- C: Insert Table

-- Master Table

/*
- MsStaff Table
“STXXX”
X => number between 0 – 9
Staff phone number must start with ‘08’ (without quote).
Staff salary must be more than or equal 3000000.
*/
insert into MsStaff (StaffID, StaffName, StaffAddress, StaffPhoneNum, StaffGender, StaffEmail, StaffSalary)
values 
('ST001', 'Alvin', 'Jl. Ayam', '08123456789', 'Male', 'Alvin@mail.com', '3100000'),
('ST002', 'Bigmom', 'Jl. Bebek', '08223456789', 'Female', 'Bigmom@mail.com', '3500000'),
('ST003', 'Cormag', 'Jl. Cicak', '08233456789', 'Male', 'Cormag@mail.com', '4000000'),
('ST004', 'Dragon', 'Jl. Depan', '08243456789', 'Male', 'Dragon@mail.com', '4500000'),
('ST005', 'Enigma', 'Jl. Enak', '08253456789', 'Female', 'Enigma@mail.com', '5000000'),
('ST006', 'Frieza', 'Jl. Furo', '08263456789', 'Female', 'Frieza@mail.com', '5500000'),
('ST007', 'Garp', 'Jl. Gege', '08273456789', 'Male', 'Garp@mail.com', '6000000'),
('ST008', 'Hisam', 'Jl. Hamtaro', '08283456789', 'Male', 'Hisam@mail.com', '7000000'),
('ST009', 'Izawa', 'Jl. Ikan', '08293456789', 'Female', 'Izawa@mail.com', '8000000'),
('ST010', 'James', 'Jl. Jalan', '08303456789', 'Male', 'James@mail.com', '9000000')

/*
- MsCategory Table
“CAXXX”
X => number between 0 – 9
*/
insert into MsCategory(CategoryID, CategoryName)
values
('CA001','Bolero'),
('CA002','Cardigan'),
('CA003','Hoodie'),
('CA004','Sweater'),
('CA005','Blazer'),
('CA006','Vest'),
('CA007','Blouse'),
('CA008','Kemeja'),
('CA009','Kaos'),
('CA010','Tank Top')

/*
- MsCustomer Table
“CUXXX”
X => number between 0 – 9
Customer Phone must start with ‘08’ (without quote).
*/
insert into MsCustomer (CustomerID, CustomerName, CustomerAddress, CustomerPhoneNumber, CustomerGender, CustomerEmail)
values
('CU001', 'Alvina' ,'Jl. Apala', '08123123123', 'Female', 'Alvina@mail.com'),
('CU002', 'Bergwijn' ,'Jl. Belanda', '08555123123', 'Male', 'Bergwijn@mail.com'),
('CU003', 'Celso' ,'Jl. Cemara', '08239123123', 'Female', 'Celso@mail.com'),
('CU004', 'Dante' ,'Jl. Dimana', '08123444123', 'Male', 'Dante@mail.com'),
('CU005', 'Eren' ,'Jl. Eta', '08123123888', 'Male', 'Eren@mail.com'),
('CU006', 'Felix' ,'Jl. Fifa', '08129871230', 'Male', 'Felix@mail.com'),
('CU007', 'Gusion' ,'Jl. Gem', '08888231238', 'Female', 'Gusion@mail.com'),
('CU008', 'Hayan' ,'Jl. Hampa', '08723123123', 'Female', 'Hayan@mail.com'),
('CU009', 'Invoker' ,'Jl. Idih', '08190563123', 'Male', 'Invoker@mail.com'),
('CU010', 'Justin' ,'Jl. Jelek', '08139784123', 'Male', 'Justin@mail.com')

/*
- MsVendor Table
Vendor Phone must start with ‘08’ (without quote).
“VEXXX”
X => number between 0 – 9
*/
insert into MsVendor (VendorID, VendorName, VendorAddress, VendorPhoneNumber, VendorEmail)
values
('VE001', 'Adubos' , 'JL. Asmr', '08122334455','Adubos@mail.com' ),
('VE002', 'Balencia' , 'JL. Baik', '08113111123','Balencia@mail.com' ),
('VE003', 'Catharcis' , 'JL. Cepat', '08134537772','Catharcis@mail.com' ),
('VE004', 'DuaSaudara' , 'JL. Duluan', '08196865455','DuaSaudara@mail.com' ),
('VE005', 'Erigo' , 'JL. Eucaliptus', '08448944556','Erigo@mail.com' ),
('VE006', 'Filla' , 'JL. Fiktid', '08293458422','Filla@mail.com' ),
('VE007', 'Genshin' , 'JL. Gacha', '08126744556','Genshin@mail.com' ),
('VE008', 'Halilintar' , 'JL. Hashiap', '08021340926','Halilintar@mail.com' ),
('VE009', 'Istana' , 'JL. Iwak', '08125940059','Istana@mail.com' ),
('VE010', 'Jeje' , 'JL. Julit', '08010102023','Jeje@mail.com' )

/*
- MsCloth Table
Cloth price must be more than or equal 20000.
Cloth brand must be more than 5 characters.
“CLXXX”
X => number between 0 – 9
*/
insert into MsCloth (ClothID, CategoryID, ClothBrand, ClothPrice, ClothStock)
values
('CL001', 'CA001', 'AlCheMist', '50000', '5'),
('CL002', 'CA002', 'Bebelix', '70000', '10'),
('CL003', 'CA003', 'Cherrish', '90000', '15'),
('CL004', 'CA004', 'DeAmoure', '110000', '20'),
('CL005', 'CA005', 'Elisse', '130000', '25'),
('CL006', 'CA006', 'Febricator', '170000', '30'),
('CL007', 'CA007', 'Galileo', '180000', '35'),
('CL008', 'CA008', 'Herman Kardos', '190000', '40'),
('CL009', 'CA009', 'IBajuku', '200000', '45'),
('CL010', 'CA010', 'Upper Armour', '210000', '50')


-- Transaction Table

-- HeaderPurchaseTransaction Table
insert into HeaderPurchaseTransaction (PurchaseTransactionID,StaffID,VendorID,PurchaseDate)
values
('PU001','ST001','VE001','2020-10-01 10:00:00'),
('PU002','ST001','VE001','2020-10-02 10:15:00'),
('PU003','ST002','VE002','2020-10-03 10:30:00'),
('PU004','ST002','VE002','2020-10-04 11:00:00'),
('PU005','ST003','VE003','2020-10-05 11:30:00'),
('PU006','ST003','VE003','2020-10-06 12:00:00'),
('PU007','ST004','VE004','2020-10-07 12:30:00'),
('PU008','ST004','VE004','2020-10-08 13:00:00'),
('PU009','ST005','VE005','2020-10-09 13:30:00'),
('PU010','ST005','VE005','2020-10-10 14:00:00'),
('PU011','ST006','VE006','2020-10-11 14:30:00'),
('PU012','ST006','VE006','2020-10-12 15:00:00'),
('PU013','ST007','VE007','2020-10-13 15:30:00'),
('PU014','ST007','VE007','2020-10-14 16:00:00'),
('PU015','ST008','VE008','2020-10-15 16:30:00'),
('PU016','ST008','VE008','2020-10-16 17:00:00'),
('PU017','ST009','VE009','2020-10-17 17:30:00'),
('PU018','ST009','VE009','2020-10-18 18:00:00'),
('PU019','ST010','VE010','2020-10-19 19:00:00'),
('PU020','ST010','VE010','2020-10-20 20:00:00')

-- HeaderSalesTransaction Table
insert into HeaderSalesTransaction (SalesTransactionID,StaffID,CustomerID,SalesDate)
values
('SA001','ST001','CU001','2020-11-01 10:00:00'),
('SA002','ST001','CU001','2020-11-02 10:15:00'),
('SA003','ST002','CU002','2020-11-03 10:30:00'),
('SA004','ST002','CU002','2020-11-04 11:00:00'),
('SA005','ST003','CU003','2020-11-05 11:30:00'),
('SA006','ST003','CU003','2020-11-06 12:00:00'),
('SA007','ST004','CU004','2020-11-07 12:30:00'),
('SA008','ST004','CU004','2020-11-08 13:00:00'),
('SA009','ST005','CU005','2020-11-09 13:30:00'),
('SA010','ST005','CU005','2020-11-10 14:00:00'),
('SA011','ST006','CU006','2020-11-11 14:30:00'),
('SA012','ST006','CU006','2020-11-12 15:00:00'),
('SA013','ST007','CU007','2020-11-13 15:30:00'),
('SA014','ST007','CU007','2020-11-14 16:00:00'),
('SA015','ST008','CU008','2020-11-15 16:30:00'),
('SA016','ST008','CU008','2020-11-16 17:00:00'),
('SA017','ST009','CU009','2020-11-17 17:30:00'),
('SA018','ST009','CU009','2020-11-18 18:00:00'),
('SA019','ST010','CU010','2020-11-19 19:00:00'),
('SA020','ST010','CU010','2020-11-20 20:00:00')

--Transaction Detail

-- DetailPurchaseTransaction Table
insert into DetailPurchaseTransaction (PurchaseTransactionID,ClothID,QtyEachCloth)
values
('PU001','CL001','1'),
('PU001','CL002','2'),
('PU002','CL002','3'),
('PU003','CL002','4'),
('PU004','CL002','5'),
('PU005','CL003','1'),
('PU006','CL003','2'),
('PU007','CL003','3'),
('PU008','CL004','4'),
('PU009','CL004','5'),
('PU010','CL004','1'),
('PU010','CL005','2'),
('PU011','CL005','3'),
('PU012','CL005','4'),
('PU013','CL006','5'),
('PU014','CL006','1'),
('PU015','CL006','2'),
('PU016','CL007','3'),
('PU017','CL007','4'),
('PU018','CL008','5'),
('PU019','CL008','1'),
('PU019','CL009','2'),
('PU019','CL010','3'),
('PU020','CL009','4'),
('PU020','CL010','5')


-- DetailSalesTransaction Table
insert into DetailSalesTransaction (SalesTransactionID,ClothID,QtyEachCloth)
values
('SA001','CL001','5'),
('SA001','CL002','4'),
('SA002','CL002','3'),
('SA003','CL002','2'),
('SA004','CL002','1'),
('SA005','CL003','5'),
('SA006','CL003','4'),
('SA007','CL003','3'),
('SA008','CL004','2'),
('SA009','CL004','1'),
('SA010','CL004','5'),
('SA010','CL005','4'),
('SA011','CL005','3'),
('SA012','CL005','2'),
('SA013','CL006','1'),
('SA014','CL006','5'),
('SA015','CL006','4'),
('SA016','CL007','3'),
('SA017','CL007','2'),
('SA018','CL008','1'),
('SA019','CL008','5'),
('SA019','CL009','4'),
('SA019','CL010','3'),
('SA020','CL009','2'),
('SA020','CL010','1')

select * from MsCategory
select * from MsCloth
select * from MsCustomer
select * from MsStaff
select * from MsVendor
select * from HeaderPurchaseTransaction
select * from HeaderSalesTransaction
select * from DetailPurchaseTransaction
select * from DetailSalesTransaction