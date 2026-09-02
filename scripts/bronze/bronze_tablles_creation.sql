CREATE TABLE bronze.crm_cust_info (
cust_id INT,
cust_key VARCHAR(50),
cust_firstname VARCHAR(50),
cust_lastname VARCHAR(50),
cust_marital_status VARCHAR(50),
cust_gndr VARCHAR(50),
cst_create_date DATE
);

CREATE TABLE bronze.crm_prd_info (
prd_id INT,
prd_key VARCHAR(50),
prd_nm VARCHAR(50),
prd_cost INT,
prd_line CHAR,
prd_start_dt DATE,
prd_end_dt DATE
);

CREATE TABLE bronze.sales_details (
sls_ord_num VARCHAR(50),
sls_prd_key VARCHAR(50),
sls_cust_id INT,
sls_order_dt DATE,
sls_ship_dt DATE,
sls_due_dt DATE,
sls_sales INT,
sls_quantity INT,
sls_price INT
);



CREATE TABLE bronze.erp_CUST_AZ12 (
CID VARCHAR(50),
BDATE DATE,
GEN VARCHAR(50)
);

CREATE TABLE bronze.erp_LOC_A101 (
CID VARCHAR(50),
CNTRY VARCHAR(50)
);

CREATE TABLE bronze.erp_PX_CAT_G1V2 (
ID VARCHAR(50),
CAT VARCHAR(50),
SUBCAT VARCHAR(50),
MAINTENANCE VARCHAR(50)
)
