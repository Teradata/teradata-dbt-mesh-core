--- Create data for Inventory Domain
--- Product Catalog
CREATE TABLE teddy_retailers_inventory.source_catalog AS
(
  SELECT product_id, product_name, product_category, price_cents
     FROM (
		LOCATION='/s3/dev-rel-demos.s3.amazonaws.com/demo-datamesh/source_products.csv') as products
) WITH DATA;

--- Stock entries
CREATE TABLE teddy_retailers_inventory.source_stock AS
(
  SELECT entry_id, product_id, product_quantity, unit_purchase_price, entry_date
     FROM (
		LOCATION='/s3/dev-rel-demos.s3.amazonaws.com/demo-datamesh/source_stock.csv') as stock
) WITH DATA;

--- Create data for Sales Domain
--- Customer directory
CREATE TABLE teddy_retailers_sales.source_customers AS
(
  SELECT customer_id, customer_name, customer_surname, customer_email
     FROM (
		LOCATION='/s3/dev-rel-demos.s3.amazonaws.com/demo-datamesh/source_customers.csv') as customers
) WITH DATA;

--- Orders 

CREATE TABLE teddy_retailers_sales.source_orders AS
(
  SELECT order_id, customer_id, order_status, order_date
     FROM (
		LOCATION='/s3/dev-rel-demos.s3.amazonaws.com/demo-datamesh/source_orders.csv') as orders
) WITH DATA;

--- Transactions
CREATE TABLE teddy_retailers_sales.source_order_products AS
(
  SELECT transaction_id, order_id, product_id, product_quantity
     FROM (
		LOCATION='/s3/dev-rel-demos.s3.amazonaws.com/demo-datamesh/source_order_products.csv') as transactions
) WITH DATA;