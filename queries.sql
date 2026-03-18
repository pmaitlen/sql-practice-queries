-- SQL Practice Queries

-- 1) Inventory by category (totals + value)
SELECT
  c.category_name,
  COUNT(*) AS item_count,
  SUM(p.serving_inventory) AS total_servings,
  ROUND(SUM(p.cost * p.serving_inventory),2) AS inventory_value
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY c.category_name;

-- 2) Highest inventory value items
SELECT
  p.product_id,
  p.product_name,
  c.category_name,
  p.cost,
  p.serving_inventory,
  ROUND(p.cost * p.serving_inventory,2) AS total_value
FROM products p
JOIN categories c ON p.category_id = c.category_id
ORDER BY total_value DESC;

-- 3) Low stock report
SELECT
  p.product_id,
  p.product_name,
  c.category_name,
  p.serving_inventory
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE p.serving_inventory < 100
ORDER BY p.serving_inventory;

-- 4) Category price stats
SELECT
  c.category_name,
  ROUND(AVG(p.cost),2) AS avg_price,
  MIN(p.cost) AS lowest_price,
  MAX(p.cost) AS highest_price
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY c.category_name;
