# Zepto SQL Data Analysis Project

## 📌 Project Overview

This project focuses on analyzing Zepto's product inventory and pricing data using **PostgreSQL**.

The objective is to explore the dataset, clean inconsistent data, and extract meaningful business insights using SQL queries.

The analysis covers product availability, pricing, discounts, inventory distribution, category-wise revenue estimation, and product weight analysis.

## 🛠️ Tools & Technologies

- **Database:** PostgreSQL
- **Language:** SQL
- **Platform:** GitHub

## 📂 Dataset Overview

The dataset contains product-level information from Zepto, including:

| Column Name | Description |
|---|---|
| `sku_id` | Unique product SKU identifier |
| `category` | Product category |
| `name` | Product name |
| `mrp` | Maximum Retail Price |
| `discountPercent` | Discount percentage |
| `availableQuantity` | Available inventory quantity |
| `discountedSellingPrice` | Discounted selling price |
| `weightInGms` | Product weight in grams |
| `outOfStock` | Product availability status |
| `quantity` | Product quantity |

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

The project answers the following business questions:

| Question | Business Analysis |
|---|---|
| Q1 | Find the top 10 best-value products based on discount percentage. |
| Q2 | Identify high-MRP products that are out of stock. |
| Q3 | Calculate estimated revenue for each category. |
| Q4 | Find products with MRP above ₹500 and discounts below 10%. |
| Q5 | Identify the top 5 categories offering the highest average discounts. |
| Q6 | Calculate price per gram for products weighing at least 100 grams. |
| Q7 | Classify products into Low, Medium, and Bulk weight categories. |
| Q8 | Calculate total inventory weight for each category. |

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
- Data Type Handling
- Data Cleaning and Transformation

## 📊 Key Business Insights

This analysis helps understand:

- Which products offer the highest discounts.
- Which expensive products are currently unavailable.
- Which product categories contribute the most estimated revenue.
- Which categories offer the best average discounts.
- How product pricing compares based on weight.
- How inventory weight is distributed across categories.

## 📥 Dataset

The dataset used in this project is sourced from Kaggle.

- **Dataset:** [Zepto Inventory Dataset](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv)
- **Source:** Kaggle
