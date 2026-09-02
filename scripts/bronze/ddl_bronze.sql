CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE 
	v_row_count INT;
	v_col_count INT;
	v_start_time TIMESTAMP;
	v_end_time TIMESTAMP;

BEGIN

RAISE NOTICE '=================================';
RAISE NOTICE 'Loading bronze layer';
RAISE NOTICE '=================================';

v_start_time := clock_timestamp();
RAISE NOTICE '-----------------------------------';
RAISE NOTICE 'Truncate table';
RAISE NOTICE '-----------------------------------';

TRUNCATE TABLE bronze.crm_cust_info;

TRUNCATE TABLE bronze.crm_prd_info;

TRUNCATE TABLE bronze.crm_sales_details;

TRUNCATE TABLE bronze.erp_CUST_AZ12;

TRUNCATE TABLE bronze.erp_LOC_A101;

TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;

RAISE NOTICE '-----------------------------------';
RAISE NOTICE 'Copying data';
RAISE NOTICE '-----------------------------------';

COPY bronze.crm_cust_info
FROM '/tmp/datasets/source_crm/cust_info.csv'
WITH (
	FORMAT csv,
	HEADER true,
	DELIMITER ','
);

COPY bronze.crm_prd_info
FROM '/tmp/datasets/source_crm/prd_info.csv'
WITH (
	FORMAT csv,
	HEADER true,
	DELIMITER ','
);

COPY bronze.crm_sales_details
FROM '/tmp/datasets/source_crm/sales_details.csv'
WITH (
	FORMAT csv,
	HEADER true,
	DELIMITER ','
);


COPY bronze.erp_cust_az12
FROM '/tmp/datasets/source_erp/CUST_AZ12.csv'
WITH (
	FORMAT csv,
	HEADER true,
	DELIMITER ','
);

COPY bronze.erp_loc_a101
FROM '/tmp/datasets/source_erp/LOC_A101.csv'
WITH (
	FORMAT csv,
	HEADER true,
	DELIMITER ','
);

COPY bronze.erp_px_cat_g1v2
FROM '/tmp/datasets/source_erp/PX_CAT_G1V2.csv'
WITH (
	FORMAT csv,
	HEADER true,
	DELIMITER ','
);

RAISE NOTICE '-----------------------------------';
RAISE NOTICE 'Table dimensions';
RAISE NOTICE '-----------------------------------';

SELECT COUNT(*) INTO v_row_count FROM bronze.crm_cust_info;
SELECT COUNT(*) INTO v_col_count FROM information_schema.columns WHERE table_schema = 'bronze' AND table_name = 'crm_cust_info';
RAISE NOTICE 'Table: %, Total Rows: % Total Columns: %', 'crm_cust_info', v_row_count, v_col_count;

SELECT COUNT(*) INTO v_row_count FROM bronze.crm_prd_info;
SELECT COUNT(*) INTO v_col_count FROM information_schema.columns WHERE table_schema = 'bronze' AND table_name = 'crm_prd_info';
RAISE NOTICE 'Table: %, Total Rows: % Total Columns: %', 'crm_prd_info', v_row_count, v_col_count;

SELECT COUNT(*) INTO v_row_count FROM bronze.crm_sales_details;
SELECT COUNT(*) INTO v_col_count FROM information_schema.columns WHERE table_schema = 'bronze' AND table_name = 'crm_sales_details';
RAISE NOTICE 'Table: %, Total Rows: % Total Columns: %', 'crm_sales_details', v_row_count, v_col_count;


SELECT COUNT(*) INTO v_row_count FROM bronze.erp_cust_az12;
SELECT COUNT(*) INTO v_col_count FROM information_schema.columns WHERE table_schema = 'bronze' AND table_name = 'erp_cust_az12';
RAISE NOTICE 'Table: %, Total Rows: % Total Columns: %', 'erp_cust_az12', v_row_count, v_col_count;

SELECT COUNT(*) INTO v_row_count FROM bronze.erp_loc_a101;
SELECT COUNT(*) INTO v_col_count FROM information_schema.columns WHERE table_schema = 'bronze' AND table_name = 'erp_loc_a101';
RAISE NOTICE 'Table: %, Total Rows: % Total Columns: %', 'erp_loc_a101', v_row_count, v_col_count;

SELECT COUNT(*) INTO v_row_count FROM bronze.erp_px_cat_g1v2;
SELECT COUNT(*) INTO v_col_count FROM information_schema.columns WHERE table_schema = 'bronze' AND table_name = 'erp_px_cat_g1v2';
RAISE NOTICE 'Table: %, Total Rows: % Total Columns: %', 'erp_px_cat_g1v2', v_row_count, v_col_count;
v_end_time := clock_timestamp();
RAISE NOTICE '>> Loard duration: % second', v_end_time - v_start_time;
END;
$$;
