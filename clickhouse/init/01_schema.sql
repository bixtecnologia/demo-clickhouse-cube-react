-- =========================================
-- CRIAÇÃO DO BANCO DE DADOS E TABELAS
-- =========================================

CREATE DATABASE IF NOT EXISTS analytics;

-- Tabela de Clientes
CREATE TABLE IF NOT EXISTS analytics.customers (
    customer_id UInt32,
    customer_name String,
    email String,
    phone String,
    city String,
    state String,
    country String,
    segment Enum('Consumer' = 1, 'Corporate' = 2, 'Home Office' = 3),
    created_at DateTime DEFAULT now()
) ENGINE = MergeTree()
ORDER BY (customer_id, created_at);

-- Tabela de Produtos
CREATE TABLE IF NOT EXISTS analytics.products (
    product_id UInt32,
    product_name String,
    category String,
    sub_category String,
    brand String,
    unit_price Decimal(10, 2),
    cost_price Decimal(10, 2),
    created_at DateTime DEFAULT now()
) ENGINE = MergeTree()
ORDER BY (product_id, category);

-- Tabela de Pedidos
CREATE TABLE IF NOT EXISTS analytics.orders (
    order_id UInt32,
    customer_id UInt32,
    order_date Date,
    ship_date Date,
    ship_mode Enum('Standard Class' = 1, 'Second Class' = 2, 'First Class' = 3, 'Same Day' = 4),
    status Enum('Pending' = 1, 'Processing' = 2, 'Shipped' = 3, 'Delivered' = 4, 'Cancelled' = 5),
    total_amount Decimal(12, 2),
    discount Decimal(5, 2) DEFAULT 0,
    profit Decimal(12, 2),
    created_at DateTime DEFAULT now()
) ENGINE = MergeTree()
ORDER BY (order_date, order_id)
PARTITION BY toYYYYMM(order_date);

-- Tabela de Itens do Pedido
CREATE TABLE IF NOT EXISTS analytics.order_items (
    item_id UInt32,
    order_id UInt32,
    product_id UInt32,
    quantity UInt16,
    unit_price Decimal(10, 2),
    discount Decimal(5, 2) DEFAULT 0,
    total Decimal(12, 2)
) ENGINE = MergeTree()
ORDER BY (order_id, item_id);

-- Tabela de Métricas Diárias (para dashboards rápidos)
CREATE TABLE IF NOT EXISTS analytics.daily_metrics (
    date Date,
    total_orders UInt32,
    total_revenue Decimal(15, 2),
    total_profit Decimal(15, 2),
    new_customers UInt32,
    avg_order_value Decimal(10, 2)
) ENGINE = SummingMergeTree()
ORDER BY date;



