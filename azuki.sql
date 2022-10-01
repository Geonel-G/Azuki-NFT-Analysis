SELECT *
FROM dbo.saleshistory

SELECT *
FROM dbo.holders

SELECT *
FROM dbo.listings

---DATA as of 2022-09-08---
---OVERALL SALES---
SELECT ROUND(SUM([Price(ETH)]),2) AS TotalSales
FROM dbo.saleshistory
---TOTAL HOLDERS---
SELECT COUNT(HolderAddress) AS Holders
FROM dbo.holders
---FLOOR PRICE---
SELECT MIN([Listing Price]) AS FloorPrice
FROM dbo.listings
---MARKET CAP---
SELECT MIN([Listing Price])*10000 AS MarketCap  ---Azuki has a total of 10,000 NFTs---
FROM dbo.listings




---LISTINGS AND SALES BY MARKET---
SELECT Market, ROUND(SUM([Price(ETH)]),2) AS MarketSales
FROM dbo.saleshistory
GROUP BY Market
ORDER BY 2 DESC

SELECT Market, COUNT(Market) AS MarketListings
FROM dbo.listings
GROUP BY Market
ORDER BY 2 DESC




---DAILY, WEEKLY, AND MONTHLY SALES---
SELECT MONTH(Date) AS Months, SUM([Price(ETH)]) AS MonthlySales
FROM dbo.saleshistory
GROUP BY MONTH(Date)
ORDER BY 2 DESC

SELECT DATEPART(WEEK, Date) AS Weeks, SUM([Price(ETH)]) AS MonthlySales
FROM dbo.saleshistory
GROUP BY DATEPART(WEEK, Date)
ORDER BY 2 DESC

SELECT Date, SUM([Price(ETH)]) AS DailySales
FROM dbo.saleshistory
GROUP BY Date
ORDER BY Date





---NUMBER OF SALES TRANSACTION PER NFT---
SELECT NFT, COUNT(Buyer) AS TransactCounts
FROM dbo.saleshistory
GROUP BY NFT
ORDER BY 2 DESC





---AVERAGE PRICE, NUMBER OF SALES AND VOLUME DAILY---
SELECT Date, COUNT(Date) AS NumberOfSales, AVG([Price(ETH)]) AS AveragePrice
, COUNT(Date) * AVG([Price(ETH)]) AS DailyVolume
FROM dbo.saleshistory
GROUP BY Date
ORDER BY Date


---NUMBER OF UNIQUE HOLDERS---
SELECT COUNT(HolderAddress) AS Owner
FROM dbo.holders
---OWNERS NFT HOLDINGS---
SELECT * FROM dbo.holders