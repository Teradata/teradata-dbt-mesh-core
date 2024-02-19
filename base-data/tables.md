## Inventory domain
### Source catalog
| Column Name   | Data Type | Description       |
|---------------|-----------|-------------------|
| product_id    | PK        | Primary Key       |
| product_name  | String    | Name of product   |
| product_category| String    | Name of product   |
| price_cents     | Integer  | Price of product  |

### Source stock
| Column Name     | Data Type | Description                         |
|-----------------|-----------|-------------------------------------|
| entry_id  | PK        | Primary Key                         |
| product_id      | FK        | Foreign Key, references Catalog     |
| product_quantity        | Integer   | Quantity of product                 |
| unit_purchase_price  | Integer  | Purchase price of product           |
| entry_date      | Date      | Date of stock entry                 |

### Core stock_product
| Column Name         | Data Type | Description                         |
|---------------------|-----------|-------------------------------------|
| product_id          | FK        | Foreign Key, references Catalog     |
| calendar_month      | Integer   | Month                               |
| calendar_year       | Integer   | Year                       |
| quantity            | Integer   | Quantity of product                 |
| avg_purchase_price  | Integer   | Purchase price of product           |

### Core product_year_summary
| Column Name         | Data Type | Description                         |
|---------------------|-----------|-------------------------------------|
| product_id          | FK        | Foreign Key, references Catalog     |
| avg_purchase_price_year  | Integer   | Purchase price of product year |

## Sales domain
### Source orders
| Column Name  | Data Type | Description                           |
|--------------|-----------|---------------------------------------|
| order_id     | PK        | Primary Key                           |
| customer_id  | FK        | Foreign Key, references Customers     |
| order_status       | String    | status open, paid, delivered |
| order_date         | Date      | Date of order                         |

### Source customers
| Column Name   | Data Type | Description           |
|---------------|-----------|-----------------------|
| customer_id   | PK        | Primary Key           |
| customer_name | String    | Name of the customer  |
| customer_surname | String    | Name of the customer  |
| customer_email | String    | Name of the customer  |

### Source orders products
| Column Name      | Data Type | Description                             |
|------------------|-----------|-----------------------------------------|
| order_id         | FK        | Foreign Key, references Orders          |
| product_id       | FK        | Foreign Key, references Catalog         |
| quantity         | Integer   | Quantity of product ordered             |

### Core customer_summary
| Column Name      | Data Type | Description                  |
|------------------|-----------|------------------------------|
| customer_id      | String    | Primary Key, unique identifier for customers |
| customer_name | String    | Name of the customer  |
| customer_surname | String    | Name of the customer  |
| customer_email | String    | Name of the customer  |
| lifetime_value   | Decimal   | Estimated lifetime value of the customer |

### Core order_summary
| Column Name      | Data Type | Description                                 |
|------------------|-----------|---------------------------------------------|
| order_id         | String    | Primary Key, unique identifier for orders   |
| customer_id      | String    | Foreign Key, references Core Customer       |
| date             | Date      | Date of order                               |
| total_value      | Decimal   | Total value of the order                    |
| order_status     | String    | Status of the order (e.g., paid, pending, cancelled) |


## Finance domain

### Core profit and losses 
| Column Name      | Data Type | Description                     |
|------------------|-----------|---------------------------------|
| record_id        | PK        | Primary Key                     |
| month            | Date      | Month of record        |
| year             | Date      | Year of record        |
| monthly_revenue  | Decimal   | Total revenue for the month     |
| monthly_cost     | Decimal   | Total cost for the month        |
| monthly_p_l      | Decimal   | Profit and Loss for the month   |


