# Zepto SQL Data Analysis Project

## 📌 Project Overview

This project focuses on analyzing Zepto's product inventory and pricing data using **PostgreSQL**.

The objective is to explore the dataset, perform data cleaning, and extract meaningful business insights using SQL queries.

The analysis covers product availability, pricing, discounts, inventory distribution, category-wise revenue estimation, and product weight analysis.

## 🛠️ Tools & Technologies

- Database: PostgreSQL
- Language: SQL
- Platform: GitHub

## 📂 Dataset Overview

The dataset contains product-level information from Zepto, including:

| Column Name | Description |
|---|---|
| sku_id | Unique product SKU identifier |
| category | Product category |
| name | Product name |
| mrp | Maximum Retail Price |
| discountPercent | Discount percentage |
| availableQuantity | Available inventory quantity |
| discountedSellingPrice | Discounted selling price |
| weightInGms | Product weight in grams |
| outOfStock | Product availability status |
| quantity | Product quantity |

## 🔍 Project Workflow

### 1. Data Exploration

- Counted the total number of records.
- Examined sample records.
- Identified missing or NULL values.
- Explored distinct product categories.
- Analyzed in-stock and out-of-stock products.
- Identified frequently occurring product names and SKUs.

### 2. Data Cleaning

- Identified products with zero MRP or selling price.
- Removed records where MRP was zero.
- Converted MRP and discounted selling prices from paise to Indian Rupees.
- Verified the updated pricing values.

### 3. Business Analysis & SQL Queries

### Q1. Find the top 10 best-value products based on discount percentage.

```sql
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;
```
###Q2. What are the products with high MRP but out of stock?
```sql
SELECT DISTINCT name, mrp
FROM zepto
WHERE outOfStock = TRUE AND mrp > 300
ORDER BY mrp DESC;
```
###Q3. Calculate estimated revenue for each category.
```sql
SELECT category,
       SUM(discountedSellingPrice * availableQuantity) AS revenue
FROM zepto
GROUP BY category
ORDER BY revenue DESC;
```
###Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
```sql
SELECT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;
```
###Q5. Identify the top 5 categories offering the highest average discount percentage.
```sql
SELECT category,
       ROUND(AVG(discountPercent), 2) AS avgDiscPercent
FROM zepto
GROUP BY category
ORDER BY avgDiscPercent DESC
LIMIT 5;
```
###Q6. Find the price per gram for products above 100g and sort by best value.
```sql
SELECT name,
       weightInGms,
       discountedSellingPrice,
       ROUND(mrp / weightInGms, 2) AS gramPrice
FROM zepto
WHERE weightInGms >= 100
ORDER BY gramPrice ASC;
```
###Q7. Group the products into categories like Low, Medium, and Bulk based on their weight in grams.
```sql
SELECT DISTINCT name,
       weightInGms,
       CASE
           WHEN weightInGms < 1000 THEN 'Low'
           WHEN weightInGms < 5000 THEN 'Medium'
           ELSE 'Bulk'
       END AS weight_category
FROM zepto;
```
###Q8. What is the total inventory weight per category?
```sql
SELECT category,
       SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;
```

## 💡 Key SQL Concepts Used

- CREATE TABLE
- DROP TABLE
- SELECT and DISTINCT
- WHERE and ORDER BY
- GROUP BY and HAVING
- Aggregate Functions (COUNT, SUM, AVG)
- CASE Statements
- UPDATE and DELETE
- ROUND()
- LIMIT
- Data Cleaning and Transformation

## 📈 Key Business Insights

This analysis helps understand:

- Which products offer the highest discounts.
- Which expensive products are currently unavailable.
- Which product categories generate the highest estimated inventory revenue.
- Which categories offer the best average discounts.
- How product pricing compares based on weight.
- How inventory weight is distributed across categories.

## 📥 Dataset

The dataset used in this project is sourced from Kaggle.

- **Dataset:** [Zepto Inventory Dataset](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv)
- **Source:** Kaggle
