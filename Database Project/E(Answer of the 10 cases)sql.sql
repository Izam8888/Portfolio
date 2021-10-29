/* Kelompok 1
Anggota Kelompok:
2301855034 - James Bezaliel Jonathan
2301859511 - Alvin Briandy Chea
2301861882 - Kendrew Gain Widjaja
2301950710 - Muhammad Hizam Al Ibrahim
*/

use TStore

-- E: Answer of the 10 cases

-- No. 1
select 
	[Transaction Count] = Count (PurchaseTransactionID),
	St.StaffName,
	V.VendorName
from HeaderPurchaseTransaction hpt
	join MsStaff St on hpt.StaffID = St.StaffID
	join MsVendor V on hpt.VendorID = V.VendorID
where St.StaffSalary between 5000000 and 10000000 
	and V.VendorName like '%o%'
group by St.StaffName,V.VendorName

-- No. 2
select
	[SalesId] = hst.SalesTransactionID,
	hst.SalesDate, 
	[CustomerName] = C.Customername,
	C.CustomerAddress
from HeaderSalesTransaction hst
	join MsCustomer C on hst.CustomerID = C.CustomerID
	join DetailSalesTransaction dst on dst.SalesTransactionID = hst.SalesTransactionID
	join MsCloth mc on MC.ClothID = dst.ClothID
where datename(day,hst.SalesDate) like 15
group by hst.SalesTransactionID,hst.SalesDate,C.CustomerName,C.CustomerAddress
having sum(mc.ClothPrice) > 150000

-- No. 3
select
	[Month] = datename(month,hst.salesdate),
	[Transaction Count] = count(hst.SalesTransactionID),
	[Cloth Sold Count] = sum(dst.QtyEachCloth),
	Cl.ClothPrice
from HeaderSalesTransaction hst
	join DetailSalesTransaction dst on hst.SalesTransactionID = dst.SalesTransactionID
	join MsStaff St on hst.StaffID = St.StaffID
	join MsCloth Cl on dst.ClothID = Cl.ClothID
where St.StaffGender = 'Female'
	and Cl.ClothPrice > 70000 
	and datediff(month,hst.SalesDate,getdate()) = 1
group by hst.SalesDate, Cl.ClothPrice


-- No. 4
select ClothBrand,
	[Maximum Cloth(s) Sold] = (count(dpt.QtyEachCloth) + count(dpt.ClothID))
from MsCloth mc, DetailPurchaseTransaction dpt
where mc.ClothID = dpt.ClothID
group by ClothBrand,dpt.ClothID 
having (count(dpt.QtyEachCloth) + count(dpt.ClothID)) between 5 and 10

-- No. 5
select c.ClothBrand, c.ClothPrice, c.ClothStock
from (
	select ClothBrand, ClothPrice, ClothStock 
	from MsCloth c
		join DetailPurchaseTransaction dp
	on c.ClothID = dp.ClothID
		join HeaderPurchaseTransaction hp
	on dp.PurchaseTransactionID = hp.PurchaseTransactionID
		join MsVendor v
	on hp.VendorID = v.VendorID
	where VendorName like 'Saad%' 
	group by ClothBrand, ClothPrice, ClothStock
	having ClothPrice > (avg(ClothPrice * QtyEachCloth) - 350000)
		and ClothPrice < avg(ClothPrice*QtyEachCloth)
	)AS c

-- No. 6
select [Sales Date] = convert(varchar,SalesDate, 101), 
	c.ClothBrand, 
	[Quantity] = d.QtyEachCloth
from HeaderSalesTransaction h
	join DetailSalesTransaction d
on h.SalesTransactionID = d.SalesTransactionID
	join MsCloth c
on d.ClothID = c.ClothID, (
	select d.QtyEachCloth
	from HeaderSalesTransaction h
		join DetailSalesTransaction d
	on h.SalesTransactionID = d.SalesTransactionID
	Where month(SalesDate) = 5
	)As q
group by SalesDate, ClothBrand, d.QtyEachCloth
having d.QtyEachCloth > count(q.QtyEachCloth)
order by quantity asc

-- No. 7
select [PurchaseId] = hpt.PurchaseTransactionId,
	[Staff Name] = lower(s.StaffName),
	[Staff Salary] = 'IDR ' + cast(s.StaffSalary as varchar(16)),
	[Purchase Date] = hpt.PurchaseDate,
	[Total Quantity] = count(dpt.QtyEachCloth)
from (
	select min(dpt.QtyEachCloth) as dikit
	from HeaderPurchaseTransaction as hpt,DetailPurchaseTransaction as dpt
	where datepart(month,hpt.PurchaseDate) = 4
	and hpt.PurchaseTransactionID = dpt.PurchaseTransactionID) 
	as d,HeaderPurchaseTransaction as hpt,MsStaff as s,DetailPurchaseTransaction as dpt
where hpt.PurchaseTransactionID = dpt.PurchaseTransactionID 
	and hpt.StaffID = s.StaffId 
	and dpt.QtyEachCloth > d.dikit
group by hpt.PurchaseTransactionID,s.StaffName,s.StaffSalary,hpt.PurchaseDate

-- No. 8
select [Vendor Id] = substring(v.VendorID,3,3),
	[Clothes Bought] = v.VendorName,cast(sum(dpt.QtyEachCloth) as varchar(16)) + ' piece(s)',
	[Vendor Phone] = '+62' + substring(v.VendorPhoneNumber,3,len(v.VendorPhoneNumber))
from (
	select sum(dpt.QtyEachCloth) as jumlah,
		count(dpt.QtyEachCloth)as banyak
	from DetailPurchaseTransaction as dpt)
	as makan, (
		select sum(dpt.QtyEachCloth) as jumlah
		from MsVendor as v, HeaderPurchaseTransaction as hpt, DetailPurchaseTransaction as dpt
	where v.VendorID = hpt.VendorID 
		and hpt.PurchaseTransactionID = dpt.PurchaseTransactionID) as j,MsVendor as v,HeaderPurchaseTransaction as hpt,DetailPurchaseTransaction as dpt
where v.VendorID = hpt.VendorID 
	and hpt.PurchaseTransactionID = dpt.PurchaseTransactionID and j.jumlah < 100 and dpt.QtyEachCloth < makan.jumlah/makan.banyak
group by substring(v.VendorID, 3, 3), v.VendorName,v.VendorPhoneNumber

-- No. 9
create view StoreSalesView as
select [SalesId] = hst.SalesTransactionID,
	[CustomerName] = mcu.CustomerName,
	[CustomerPhone] = mcu.CustomerPhoneNumber,
	[Cloth Average Price] = 'IDR ' + cast(avg(mcl.ClothPrice) as varchar),
	[Sales Quantity] = cast(sum(dst.QtyEachCloth) as varchar) + ' piece(s)' 
from HeaderSalesTransaction hst
	join MsCustomer mcu on mcu.CustomerID = hst.CustomerID
	join DetailSalesTransaction dst on hst.SalesTransactionID = dst.SalesTransactionID
	join MsCloth mcl on dst.ClothID = mcl.ClothID
group by hst.SalesTransactionID, mcu.CustomerName, mcu.CustomerPhoneNumber
having avg(mcl.ClothPrice) > 100000 and
sum(dst.QtyEachCloth) > 4

select * from StoreSalesView
-- drop view StoreSalesView

-- No. 10
create view StorePurchaseView as
select [Purchase Month] = datename(month, hpt.PurchaseDate),
	[Minimum Purchase Quantity] = min(dpt.QtyEachCloth),
	[Purchase Cloth Count] = count(dpt.QtyEachCloth)
from HeaderPurchaseTransaction hpt
	join DetailPurchaseTransaction dpt on dpt.PurchaseTransactionID = hpt.PurchaseTransactionID
group by hpt.PurchaseDate
having min(dpt.QtyEachCloth) > 10 and
count(dpt.QtyEachCloth) > 1

select * from StorePurchaseView
-- drop view StorePurchaseView