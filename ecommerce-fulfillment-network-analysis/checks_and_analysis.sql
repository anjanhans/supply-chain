CREATE DATABASE analytics;

USE analytics;

===================================================
-- TABLE COLUMN'S STRUCTURE AND DATA TYPE --
===================================================

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    COLUMN_TYPE,
    IS_NULLABLE,
    COLUMN_KEY
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'analytics'
ORDER BY TABLE_NAME,ORDINAL_POSITION;

============================================
-- TOTAL ROWS PER TABLE --
============================================

SELECT
    'facilities' AS table_name,
    COUNT(*) AS row_count
FROM facilities

UNION ALL

SELECT
    'orders',
    COUNT(*)
FROM orders

UNION ALL

SELECT
    'order_items',
    COUNT(*)
FROM order_items

UNION ALL

SELECT
    'daily_operations',
    COUNT(*)
FROM daily_operations

UNION ALL

SELECT
    'cost_records',
    COUNT(*)
FROM cost_records

UNION ALL

SELECT
    'inventory_snapshots',
    COUNT(*)
FROM inventory_snapshots

UNION ALL

SELECT
    'quality_defects',
    COUNT(*)
FROM quality_defects;


===================
-- NULL CHECK --
===================

-- "quality_defects" --

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN facility_id IS NULL THEN 1 ELSE 0 END) AS facility_id_nulls,
    SUM(CASE WHEN defect_date IS NULL THEN 1 ELSE 0 END) AS defect_date_nulls,
    SUM(CASE WHEN defect_type IS NULL THEN 1 ELSE 0 END) AS defect_type_nulls,
    SUM(CASE WHEN defect_count IS NULL THEN 1 ELSE 0 END) AS defect_count_nulls,
    SUM(CASE WHEN opportunities IS NULL THEN 1 ELSE 0 END) AS opportunities_nulls,
    SUM(CASE WHEN dpmo_by_defect_type IS NULL THEN 1 ELSE 0 END) AS dpmo_by_defect_type_nulls
FROM quality_defects;
    
-- "orders" --

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS order_id_nulls,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS order_date_nulls,
    SUM(CASE WHEN order_timestamp IS NULL THEN 1 ELSE 0 END) AS order_timestamp_nulls,
    SUM(CASE WHEN facility_id IS NULL THEN 1 ELSE 0 END) AS facility_id_nulls,
    SUM(CASE WHEN facility_type IS NULL THEN 1 ELSE 0 END) AS facility_type_nulls,
    SUM(CASE WHEN facility_city IS NULL THEN 1 ELSE 0 END) AS facility_city_nulls,
    SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) AS region_nulls,
    SUM(CASE WHEN shift IS NULL THEN 1 ELSE 0 END) AS shift_nulls,
    SUM(CASE WHEN product_category IS NULL THEN 1 ELSE 0 END) AS product_category_nulls,
    SUM(CASE WHEN units_ordered IS NULL THEN 1 ELSE 0 END) AS units_ordered_nulls,
    SUM(CASE WHEN order_value_inr IS NULL THEN 1 ELSE 0 END) AS order_value_inr_nulls,
    SUM(CASE WHEN order_status IS NULL THEN 1 ELSE 0 END) AS order_status_nulls,
    SUM(CASE WHEN processing_start_timestamp IS NULL THEN 1 ELSE 0 END) AS processing_start_timestamp_nulls,
    SUM(CASE WHEN processing_end_timestamp IS NULL THEN 1 ELSE 0 END) AS processing_end_timestamp_nulls,
    SUM(CASE WHEN processing_minutes IS NULL THEN 1 ELSE 0 END) AS processing_minutes_nulls,
    SUM(CASE WHEN cpt_minutes IS NULL THEN 1 ELSE 0 END) AS cpt_minutes_nulls,
    SUM(CASE WHEN cpt_sla_minutes IS NULL THEN 1 ELSE 0 END) AS cpt_sla_minutes_nulls,
    SUM(CASE WHEN cpt_breach_flag IS NULL THEN 1 ELSE 0 END) AS cpt_breach_flag_nulls,
    SUM(CASE WHEN dispatch_timestamp IS NULL THEN 1 ELSE 0 END) AS dispatch_timestamp_nulls,
    SUM(CASE WHEN delivery_timestamp IS NULL THEN 1 ELSE 0 END) AS delivery_timestamp_nulls,
    SUM(CASE WHEN delivery_days IS NULL THEN 1 ELSE 0 END) AS delivery_days_nulls,
    SUM(CASE WHEN defect_flag IS NULL THEN 1 ELSE 0 END) AS defect_flag_nulls,
    SUM(CASE WHEN defect_type IS NULL THEN 1 ELSE 0 END) AS defect_type_nulls,
    SUM(CASE WHEN defect_opportunities IS NULL THEN 1 ELSE 0 END) AS defect_opportunities_nulls,
    SUM(CASE WHEN labor_hours_order IS NULL THEN 1 ELSE 0 END) AS labor_hours_order_nulls,
    SUM(CASE WHEN labor_cost_inr IS NULL THEN 1 ELSE 0 END) AS labor_cost_inr_nulls,
    SUM(CASE WHEN shipping_cost_inr IS NULL THEN 1 ELSE 0 END) AS shipping_cost_inr_nulls,
    SUM(CASE WHEN handling_cost_inr IS NULL THEN 1 ELSE 0 END) AS handling_cost_inr_nulls,
    SUM(CASE WHEN total_fulfillment_cost_inr IS NULL THEN 1 ELSE 0 END) AS total_fulfillment_cost_inr_nulls
FROM orders;

-- 'order_items' TABLE NULLS --

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS order_id_nulls,
    SUM(CASE WHEN item_line IS NULL THEN 1 ELSE 0 END) AS item_line_nulls,
    SUM(CASE WHEN product_category IS NULL THEN 1 ELSE 0 END) AS product_category_nulls,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS quantity_nulls,
    SUM(CASE WHEN item_value_inr IS NULL THEN 1 ELSE 0 END) AS item_value_inr_nulls
FROM order_items;

-- "inventory_snapshots" --

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN facility_id IS NULL THEN 1 ELSE 0 END) AS facility_id_nulls,
    SUM(CASE WHEN snapshot_date IS NULL THEN 1 ELSE 0 END) AS snapshot_date_nulls,
    SUM(CASE WHEN ending_inventory_units IS NULL THEN 1 ELSE 0 END) AS ending_inventory_units_nulls,
    SUM(CASE WHEN inbound_units IS NULL THEN 1 ELSE 0 END) AS inbound_units_nulls,
    SUM(CASE WHEN outbound_units IS NULL THEN 1 ELSE 0 END) AS outbound_units_nulls,
    SUM(CASE WHEN lost_units IS NULL THEN 1 ELSE 0 END) AS lost_units_nulls,
    SUM(CASE WHEN assumed_loss_rate_pct IS NULL THEN 1 ELSE 0 END) AS assumed_loss_rate_pct_nulls
FROM inventory_snapshots;

-- "facilities" --

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN facility_id IS NULL THEN 1 ELSE 0 END) AS facility_id_nulls,
    SUM(CASE WHEN facility_type IS NULL THEN 1 ELSE 0 END) AS facility_type_nulls,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS city_nulls,
    SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) AS region_nulls,
    SUM(CASE WHEN facility_size IS NULL THEN 1 ELSE 0 END) AS facility_size_nulls,
    SUM(CASE WHEN daily_capacity_orders IS NULL THEN 1 ELSE 0 END) AS daily_capacity_orders_nulls
FROM facilities;

-- "daily_operation" --

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN facility_id IS NULL THEN 1 ELSE 0 END) AS facility_id_nulls,
    SUM(CASE WHEN operation_date IS NULL THEN 1 ELSE 0 END) AS operation_date_nulls,
    SUM(CASE WHEN orders_processed IS NULL THEN 1 ELSE 0 END) AS orders_processed_nulls,
    SUM(CASE WHEN cpt_breaches IS NULL THEN 1 ELSE 0 END) AS cpt_breaches_nulls,
    SUM(CASE WHEN labor_hours IS NULL THEN 1 ELSE 0 END) AS labor_hours_nulls,
    SUM(CASE WHEN total_fulfillment_cost_inr IS NULL THEN 1 ELSE 0 END) AS total_fulfillment_cost_inr_nulls,
    SUM(CASE WHEN defects IS NULL THEN 1 ELSE 0 END) AS defects_nulls,
    SUM(CASE WHEN defect_opportunities IS NULL THEN 1 ELSE 0 END) AS defect_opportunities_nulls,
    SUM(CASE WHEN orders_per_labor_hour IS NULL THEN 1 ELSE 0 END) AS orders_per_labor_hour_nulls,
    SUM(CASE WHEN cpt_breach_rate_pct IS NULL THEN 1 ELSE 0 END) AS cpt_breach_rate_pct_nulls,
    SUM(CASE WHEN dpmo IS NULL THEN 1 ELSE 0 END) AS dpmo_nulls
FROM daily_operations;

-- "cost_records" --

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN facility_id IS NULL THEN 1 ELSE 0 END) AS facility_id_nulls,
    SUM(CASE WHEN cost_date IS NULL THEN 1 ELSE 0 END) AS cost_date_nulls,
    SUM(CASE WHEN orders_processed IS NULL THEN 1 ELSE 0 END) AS orders_processed_nulls,
    SUM(CASE WHEN labor_hours IS NULL THEN 1 ELSE 0 END) AS labor_hours_nulls,
    SUM(CASE WHEN total_fulfillment_cost_inr IS NULL THEN 1 ELSE 0 END) AS total_fulfillment_cost_inr_nulls,
    SUM(CASE WHEN labor_cost_inr IS NULL THEN 1 ELSE 0 END) AS labor_cost_inr_nulls,
    SUM(CASE WHEN shipping_cost_inr IS NULL THEN 1 ELSE 0 END) AS shipping_cost_inr_nulls,
    SUM(CASE WHEN handling_cost_inr IS NULL THEN 1 ELSE 0 END) AS handling_cost_inr_nulls,
    SUM(CASE WHEN cost_per_order_inr IS NULL THEN 1 ELSE 0 END) AS cost_per_order_inr_nulls
FROM cost_records;

===========================
-- DUPLICATE RECORDS --
===========================

-- "quality_defects" --

SELECT
    `facility_id`, 
    `defect_date`, 
    `defect_type`, 
    `defect_count`, 
    `opportunities`, 
    `dpmo_by_defect_type`,
    COUNT(*) AS duplicate
FROM quality_defects
GROUP BY `facility_id`, `defect_date`, `defect_type`, `defect_count`, `opportunities`, `dpmo_by_defect_type`
HAVING COUNT(*) > 1;

-- "orders" --

SELECT
   `order_id`, 
   `order_date`, 
   `order_timestamp`, 
   `facility_id`, 
   `facility_type`, 
   `facility_city`, 
   `region`, 
   `shift`, 
   `product_category`, 
   `units_ordered`, 
   `order_value_inr`, 
   `order_status`, 
   `processing_start_timestamp`, 
   `processing_end_timestamp`, `processing_minutes`, `cpt_minutes`, `cpt_sla_minutes`, `cpt_breach_flag`, `dispatch_timestamp`, `delivery_timestamp`, `delivery_days`, `defect_flag`, `defect_type`, `defect_opportunities`, `labor_hours_order`, `labor_cost_inr`, `shipping_cost_inr`, `handling_cost_inr`, `total_fulfillment_cost_inr`
    ,COUNT(*) AS duplicates
FROM orders
GROUP BY `order_id`, `order_date`, `order_timestamp`, `facility_id`, `facility_type`, `facility_city`, `region`, `shift`, `product_category`, `units_ordered`, `order_value_inr`, `order_status`, `processing_start_timestamp`, `processing_end_timestamp`, `processing_minutes`, `cpt_minutes`, `cpt_sla_minutes`, `cpt_breach_flag`, `dispatch_timestamp`, `delivery_timestamp`, `delivery_days`, `defect_flag`, `defect_type`, `defect_opportunities`, `labor_hours_order`, `labor_cost_inr`, `shipping_cost_inr`, `handling_cost_inr`, `total_fulfillment_cost_inr`
HAVING COUNT(*) > 1;

-- "order_items" --

SELECT
    `order_id`, 
    `item_line`, 
    `product_category`, 
    `quantity`, 
    `item_value_inr`,
    COUNT(*) AS duplicates
FROM order_items
GROUP BY `order_id`, `item_line`, `product_category`, `quantity`, `item_value_inr`
HAVING COUNT(*) > 1;

-- "inventory_snapshots" --

SELECT
   `facility_id`, 
   `snapshot_date`, 
   `ending_inventory_units`, 
   `inbound_units`, 
   `outbound_units`, 
   `lost_units`, 
   `assumed_loss_rate_pct`,
   COUNT(*) AS duplicates
FROM inventory_snapshots
GROUP BY `facility_id`, 
         `snapshot_date`, 
         `ending_inventory_units`, 
         `inbound_units`, 
         `outbound_units`, 
         `lost_units`, 
         `assumed_loss_rate_pct`
HAVING COUNT(*) > 1;

-- "facilities" --

SELECT
   `facility_id`, 
   `facility_type`, 
   `city`, 
   `region`, 
   `facility_size`, 
   `daily_capacity_orders`,
   COUNT(*) AS duplicates
FROM facilities
GROUP BY `facility_id`, 
		 `facility_type`, 
         `city`, 
         `region`, 
         `facility_size`, 
         `daily_capacity_orders`
HAVING COUNT(*) > 1;

-- "daily_operations" --

SELECT
    `facility_id`, 
    `operation_date`, 
    `orders_processed`, 
    `cpt_breaches`, 
    `labor_hours`, 
    `total_fulfillment_cost_inr`, 
    `defects`, 
    `defect_opportunities`, 
    `orders_per_labor_hour`, 
    `cpt_breach_rate_pct`, 
    `dpmo`
    ,COUNT(*) AS duplicates
FROM daily_operations
GROUP BY `facility_id`, `operation_date`, `orders_processed`, `cpt_breaches`, `labor_hours`, `total_fulfillment_cost_inr`, `defects`, `defect_opportunities`, `orders_per_labor_hour`, `cpt_breach_rate_pct`, `dpmo`
HAVING COUNT(*) > 1;

-- "cost_records" --

SELECT
   `facility_id`, 
   `cost_date`, 
   `orders_processed`, 
   `labor_hours`, 
   `total_fulfillment_cost_inr`, 
   `labor_cost_inr`, 
   `shipping_cost_inr`, 
   `handling_cost_inr`, 
   `cost_per_order_inr`,
   COUNT(*) AS duplicates
FROM cost_records
GROUP BY 
    `facility_id`, 
    `cost_date`, 
    `orders_processed`, 
    `labor_hours`, 
    `total_fulfillment_cost_inr`, 
    `labor_cost_inr`, 
    `shipping_cost_inr`, 
    `handling_cost_inr`, 
    `cost_per_order_inr`
HAVING COUNT(*) > 1;


===================================
-- FACILITY LEVEL CPT BREACH --
===================================

SELECT
    facility_id,
    facility_type,
    facility_city,
    region,
    COUNT(order_id) AS total_orders,
    SUM(cpt_breach_flag) AS total_cpt_breach,
    ROUND(100.0 * SUM(cpt_breach_flag) / COUNT(order_id),2) AS cpt_breach_pct
FROM orders
GROUP BY facility_id, facility_type, facility_city, region
ORDER BY ROUND(100.0 * SUM(cpt_breach_flag) / COUNT(order_id),2) DESC; 

===============================
-- SHIFT LEVEL CPT BREACH --
===============================

SELECT
    facility_city,
	facility_id,
    facility_type,
    shift,
    ROUND(100.0 * SUM(cpt_breach_flag) / COUNT(order_id),2) AS cpt_breach_pct
FROM orders
GROUP BY facility_city, facility_id, facility_type, shift
ORDER BY facility_city ASC,ROUND(100.0 * SUM(cpt_breach_flag) / COUNT(order_id),2) DESC;

========================================================================================
# Evening shifts seems to have higher breach rate in most of the facilities #

-- TOTAL ORDERS, CPT BREACH RATE AND AVERAGE PROCESSING TIME (BY SHIFT) --
==========================================================================================

SELECT
    shift,
    COUNT(order_id) AS total_orders,
    ROUND(100.0 * SUM(cpt_breach_flag) / COUNT(order_id),2) AS cpt_breach_pct,
    ROUND(AVG(processing_minutes),2) AS avg_processing_time_minutes
FROM orders
GROUP BY shift
ORDER BY ROUND(100.0 * SUM(cpt_breach_flag) / COUNT(order_id),2) DESC;

=================================================================================
-- MONTHLY TREND OF EVENING SHIFT CPT BREACH'S --

-- To check whether evening evening shift performance is improving or not --
=================================================================================

SELECT
    DATE_FORMAT(order_date, "%Y-%m") AS month,
    COUNT(order_id) AS total_orders,
    ROUND(100.0 * SUM(cpt_breach_flag) / COUNT(order_id),2) AS cpt_breach_pct,
    ROUND(AVG(processing_minutes),2) AS avg_processing_time_minutes
FROM orders
WHERE shift = 'Evening'
GROUP BY DATE_FORMAT(order_date, "%Y-%m")
ORDER BY DATE_FORMAT(order_date, "%Y-%m") ASC;

=====================================================================================================
-- DOES EVENING SHIFT'S CPT UNDERPERFORMANCE COINCIDE WITH HIGHER FULFILLMENT COST PER ORDERS? --
=====================================================================================================

SELECT
    shift,
    COUNT(order_id) AS total_orders,
    SUM(units_ordered) AS order_volume,
    ROUND(100.0 * SUM(cpt_breach_flag) / COUNT(order_id),2) AS cpt_breach_pct,
    ROUND(AVG(total_fulfillment_cost_inr),2) AS avg_fulfillment_cost_inr,
    ROUND(SUM(total_fulfillment_cost_inr),2) AS total_fulfillment_cost_inr
FROM orders
GROUP BY shift
ORDER BY ROUND(SUM(total_fulfillment_cost_inr),2) DESC;

=======================================================
-- SHIFT LEVEL COST COMPONENTS & FULFILLMENT COST --
=======================================================

SELECT
   shift,
   COUNT(order_id) AS total_orders,
   ROUND(AVG(labor_cost_inr),2) AS avg_labor_cost_inr,
   ROUND(AVG(shipping_cost_inr),2) AS avg_shipping_cost_inr,
   ROUND(AVG(handling_cost_inr),2) AS avg_handling_cost_inr,
   ROUND(AVG(total_fulfillment_cost_inr),2) AS avg_fulfillment_cost_inr
FROM orders
GROUP BY shift
ORDER BY ROUND(AVG(total_fulfillment_cost_inr),2) DESC;

============================================================================================================
-- DOES EVENING SHIFT'S HIGHER LABOR COST PER ORDER COINCIDE WITH LOWER ORDER THROUGHOUT PER LABOR HOUR --
============================================================================================================

SELECT
   shift,
   COUNT(order_id) AS total_orders,
   ROUND(SUM(labor_hours_order),2) AS total_labor_hours,
   ROUND(SUM(labor_hours_order) / COUNT(order_id),2) AS avg_labor_hours_per_order,
   ROUND(COUNT(order_id) / SUM(labor_hours_order),2) AS orders_per_labor_hour,
   ROUND(AVG(labor_cost_inr),2) AS avg_labor_cost_per_order_inr
FROM orders
GROUP BY shift
ORDER BY ROUND(COUNT(order_id) / SUM(labor_hours_order),2) ASC;

========================================================
-- FACILITY LEVEL EVENING SHIFT LABOR PRODUCTIVITY --
========================================================

SELECT
   facility_city,
   facility_id,
   facility_type,
   COUNT(order_id) AS total_orders,
   ROUND(SUM(labor_hours_order),2) AS total_labor_hours,
   ROUND(SUM(labor_hours_order) / COUNT(order_id),2) AS avg_labor_hours_per_order,
   ROUND(COUNT(order_id) / SUM(labor_hours_order),2) AS orders_per_labor_hour,
   ROUND(AVG(labor_cost_inr),2) AS avg_labor_cost_per_order_inr
FROM orders
WHERE shift = 'evening'
GROUP BY facility_city,
   facility_id,
   facility_type
ORDER BY ROUND(COUNT(order_id) / SUM(labor_hours_order),2) ASC;
    

==========================================================
-- INVENTORY LOSS PERFORMANCE ACROSS FACILITIES --
==========================================================

SELECT
    facility_id,
    SUM(inbound_units) AS total_inbound_units,
    SUM(outbound_units) AS total_outbound_units,
    SUM(lost_units) AS total_units_lost,
    ROUND(100.0 * SUM(lost_units) / NULLIF(SUM(inbound_units) + SUM(outbound_units),0),2) AS inventory_loss_rate
FROM inventory_snapshots
GROUP BY facility_id
ORDER BY ROUND(100.0 * SUM(lost_units) / NULLIF(SUM(inbound_units) + SUM(outbound_units),0),2) DESC;

======================================
-- MONTHLY INVENTORY LOSS TREND --
======================================

SELECT
    DATE_FORMAT(snapshot_date,'%Y-%m') AS month,
    SUM(inbound_units) AS total_inbound_units,
    SUM(outbound_units) AS total_outbound_units,
    SUM(lost_units) AS total_units_lost,
    ROUND(100.0 * SUM(lost_units) / NULLIF(SUM(inbound_units) + SUM(outbound_units),0),2) AS inventory_loss_rate
FROM inventory_snapshots
GROUP BY DATE_FORMAT(snapshot_date,'%Y-%m')
ORDER BY DATE_FORMAT(snapshot_date,'%Y-%m') ASC;

==============================
-- FACILITY LEVEL QUALITY --
==============================

SELECT
   facility_city,
   SUM(defect_flag) AS total_defects,
   SUM(defect_opportunities) AS total_defect_opportunities,
   ROUND(1000000.0 * SUM(defect_flag) / NULLIF(SUM(defect_opportunities),0),2) AS dpmo
FROM orders
GROUP BY facility_city
ORDER BY ROUND(1000000.0 * SUM(defect_flag) / NULLIF(SUM(defect_opportunities),0),2) DESC;

============================================================
-- RETURNS AND CANCELLATION PERFORMANCE --
============================================================

-- Facility - level --

SELECT
    facility_id,
    facility_type,
    ROUND(100.0 * SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(order_id),2) AS cancelled_orders_pct,
    ROUND(100.0 * SUM(CASE WHEN order_status = 'Returned' THEN 1 ELSE 0 END) / COUNT(order_id),2) AS returned_orders_pct
FROM orders
GROUP BY facility_id,
    facility_type
ORDER BY ROUND(100.0 * SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(order_id),2) DESC;


-- Product category wise --


SELECT
    product_category,
    ROUND(100.0 * SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(order_id),2) AS cancelled_orders_pct,
    ROUND(100.0 * SUM(CASE WHEN order_status = 'Returned' THEN 1 ELSE 0 END) / COUNT(order_id),2) AS returned_orders_pct
FROM orders
GROUP BY product_category
ORDER BY ROUND(100.0 * SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(order_id),2) DESC;
    

-- Monthly return and cancellation trend --

SELECT
   DATE_FORMAT(order_date, '%Y-%m') AS month,
   ROUND(100.0 * SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(order_id),2) AS cancelled_orders_pct,
   ROUND(100.0 * SUM(CASE WHEN order_status = 'Returned' THEN 1 ELSE 0 END) / COUNT(order_id),2) AS returned_orders_pct
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY DATE_FORMAT(order_date, '%Y-%m') ASC;
   
=====================================================
-- CPT BREACH vs LABOR PRODUCTIVITY & LABOR COST --
=====================================================

SELECT
    facility_id,
    facility_city,
    facility_type,
    shift,
    ROUND(100.0 * SUM(cpt_breach_flag) / COUNT(order_id),2) AS cpt_breach_pct,
    ROUND(100.0 * COUNT(order_id) / NULLIF(SUM(labor_hours_order),0),2) AS orders_per_labor_hour,
    ROUND(AVG(processing_minutes),2) AS avg_processing_minutes,
    ROUND(AVG(labor_cost_inr),2) AS labor_cost_per_order_inr
FROM orders
GROUP BY facility_id,
    facility_city,
    facility_type,
    shift
ORDER BY ROUND(100.0 * SUM(cpt_breach_flag) / COUNT(order_id),2) DESC;



