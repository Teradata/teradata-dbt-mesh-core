# Data Mesh Architecture with dbt-core and Teradata Vantage™

## What is a Data Mesh

Data mesh is an architectural approach that advocates for breaking down intricate data architectures into smaller, more manageable elements. These elements are designed to cater to specific business domains and expose datasets with designated data contracts to data consumers. This approach simplifies the maintenance and governance of data in complex dbt implementations.

## When to use Data Mesh in the context of dbt

Data mesh architecture is recommended in scenarios where:

- Traditional single-project dbt setups become complex and difficult to maintain.
- There's a need to accommodate diverse data requirements across different organizational domains.
- Simplified data governance and democratization are essential for enhancing data accessibility and usability.

## Description of the Repository

### Projects Directory

The repository comprises multiple dbt projects representing different business domains:

- **Inventory:** Models related to product catalog and stock management.
- **Sales:** Models related to customer data and order management.
- **Finance:** Models related to financial data analysis.

Each project exposes specific datasets and functionalities tailored to its respective domain.

### References Directory

The `references` directory contains standalone SQL scripts to run in your database client. These scripts include commands for creating databases, loading sample data, and other necessary setup tasks.

## Business Contexts

The example scenario provided in the article revolves around Teddy Retailers, an organization managing data related to inventory, sales, and finance domains. Operational sources and data requirements are outlined to illustrate the application of data mesh architecture in addressing specific business needs.

### Data Sources

#### Inventory

- **Product Catalog:** Contains product ID, name, category, and current market price.
- **Stock Entries:** Includes entry ID, product ID, quantity, and purchase price.

#### Sales

- **Orders:** Contains order ID, customer ID, status, and date.
- **Order Products:** Includes transaction ID, order ID, product ID, and quantity.

### dbt Models

#### Inventory

- **Product Catalog:** Models product information including ID, name, category, and price.
- **Stock Per Calendar Month:** Calculates the quantity of each product acquired each month and the average price of acquisition for each product in that period.

#### Sales

- **Customer Directory:** Models customer information and calculates each customer's total lifetime value (TLV).
- **Order Summary:** Calculates the total value of each order.

#### Finance

- **Order Profit and Loss:** Calculates the total cost and value of orders.


## Setting up the Development Environment

For setting up the development environment, follow these steps:

1. Navigate to the `projects` directory in your local data mesh repository.
2. Create and activate a Python virtual environment (at the time of writing the latest Python version supported is 3.11).
3. Install dbt-teradata: `python -m pip install dbt-core dbt-teradata`.
4. Install the dbt-loom plugin: `pip install dbt-loom`.
5. Copy the contents of `projects/profiles-sample.yml` to your home’s directory `.dbt/profiles.yml` file, if this file doesn’t exist in your system you need to create it.
6. Edit the `.dbt/profiles.yml` file with the appropriate host, username, and password according to your Teradata Vantage configuration for the three projects.

## Running the Data Mesh

To run the data mesh, follow these steps:

1. Navigate to the directory of each data mesh project.
2. With your virtual environment activated, execute the following commands:
   - `dbt debug` to ensure proper connection to your Teradata Vantage instance.
   - `dbt run` to run the project.
3. When executing a referencing project, observe dbt-loom injecting the referenced models as part of the DAG execution of the referencing project.

## Final Considerations

dbt-loom, as a free and open-source project, does specify certain caveats related to the use of dbt-plugins. It is worth mentioning that documentation and lineage, generated by `dbt docs generate` don’t reflect in detail the provenance of referenced models, as related to their home project.