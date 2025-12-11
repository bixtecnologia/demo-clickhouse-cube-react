-- =========================================
-- INSERÇÃO DE DADOS DE DEMONSTRAÇÃO
-- =========================================

-- Inserir Clientes
INSERT INTO analytics.customers (customer_id, customer_name, email, phone, city, state, country, segment) VALUES
(1, 'Maria Silva', 'maria.silva@email.com', '(11) 99999-1111', 'São Paulo', 'SP', 'Brasil', 'Consumer'),
(2, 'João Santos', 'joao.santos@empresa.com', '(21) 99999-2222', 'Rio de Janeiro', 'RJ', 'Brasil', 'Corporate'),
(3, 'Ana Oliveira', 'ana.oliveira@email.com', '(31) 99999-3333', 'Belo Horizonte', 'MG', 'Brasil', 'Consumer'),
(4, 'Carlos Souza', 'carlos@homeoffice.com', '(41) 99999-4444', 'Curitiba', 'PR', 'Brasil', 'Home Office'),
(5, 'Fernanda Lima', 'fernanda.lima@corp.com', '(51) 99999-5555', 'Porto Alegre', 'RS', 'Brasil', 'Corporate'),
(6, 'Pedro Costa', 'pedro.costa@email.com', '(61) 99999-6666', 'Brasília', 'DF', 'Brasil', 'Consumer'),
(7, 'Juliana Almeida', 'juliana@empresa.com', '(71) 99999-7777', 'Salvador', 'BA', 'Brasil', 'Corporate'),
(8, 'Ricardo Ferreira', 'ricardo.f@home.com', '(81) 99999-8888', 'Recife', 'PE', 'Brasil', 'Home Office'),
(9, 'Camila Rodrigues', 'camila.r@email.com', '(85) 99999-9999', 'Fortaleza', 'CE', 'Brasil', 'Consumer'),
(10, 'Lucas Mendes', 'lucas.mendes@corp.com', '(62) 99999-0000', 'Goiânia', 'GO', 'Brasil', 'Corporate'),
(11, 'Patricia Santos', 'patricia@email.com', '(11) 98888-1111', 'Campinas', 'SP', 'Brasil', 'Consumer'),
(12, 'Bruno Oliveira', 'bruno@empresa.com', '(21) 98888-2222', 'Niterói', 'RJ', 'Brasil', 'Corporate'),
(13, 'Mariana Costa', 'mariana@home.com', '(31) 98888-3333', 'Contagem', 'MG', 'Brasil', 'Home Office'),
(14, 'Felipe Alves', 'felipe.alves@email.com', '(41) 98888-4444', 'Londrina', 'PR', 'Brasil', 'Consumer'),
(15, 'Aline Ribeiro', 'aline@corp.com', '(51) 98888-5555', 'Caxias do Sul', 'RS', 'Brasil', 'Corporate');

-- Inserir Produtos
INSERT INTO analytics.products (product_id, product_name, category, sub_category, brand, unit_price, cost_price) VALUES
(1, 'Notebook Pro 15"', 'Tecnologia', 'Computadores', 'TechBrand', 4500.00, 3200.00),
(2, 'Monitor 27" 4K', 'Tecnologia', 'Monitores', 'ViewMax', 2200.00, 1500.00),
(3, 'Teclado Mecânico RGB', 'Tecnologia', 'Acessórios', 'GameTech', 450.00, 280.00),
(4, 'Mouse Wireless Pro', 'Tecnologia', 'Acessórios', 'GameTech', 250.00, 150.00),
(5, 'Cadeira Ergonômica', 'Móveis', 'Cadeiras', 'ComfortPlus', 1800.00, 1100.00),
(6, 'Mesa de Escritório', 'Móveis', 'Mesas', 'OfficePro', 1200.00, 750.00),
(7, 'Webcam HD 1080p', 'Tecnologia', 'Acessórios', 'ViewMax', 380.00, 220.00),
(8, 'Headset Bluetooth', 'Tecnologia', 'Áudio', 'SoundPro', 550.00, 350.00),
(9, 'SSD 1TB NVMe', 'Tecnologia', 'Armazenamento', 'DataStore', 650.00, 450.00),
(10, 'Hub USB-C 7 portas', 'Tecnologia', 'Acessórios', 'TechBrand', 180.00, 100.00),
(11, 'Impressora Multifuncional', 'Tecnologia', 'Impressoras', 'PrintMax', 1100.00, 750.00),
(12, 'Estante Organizadora', 'Móveis', 'Armazenamento', 'OfficePro', 450.00, 280.00),
(13, 'Luminária LED Desk', 'Decoração', 'Iluminação', 'LightHome', 220.00, 130.00),
(14, 'Suporte para Monitor', 'Móveis', 'Acessórios', 'ComfortPlus', 180.00, 100.00),
(15, 'Mousepad XL', 'Tecnologia', 'Acessórios', 'GameTech', 120.00, 60.00);

-- Inserir Pedidos - Janeiro 2025
INSERT INTO analytics.orders (order_id, customer_id, order_date, ship_date, ship_mode, status, total_amount, discount, profit) VALUES
(1001, 1, '2025-01-05', '2025-01-10', 'Standard Class', 'Delivered', 4950.00, 0.00, 1300.00),
(1002, 3, '2025-01-08', '2025-01-12', 'Second Class', 'Delivered', 2580.00, 0.05, 720.00),
(1003, 5, '2025-01-12', '2025-01-14', 'First Class', 'Delivered', 6700.00, 0.10, 1890.00),
(1004, 2, '2025-01-15', '2025-01-20', 'Standard Class', 'Delivered', 1980.00, 0.00, 550.00),
(1005, 7, '2025-01-20', '2025-01-22', 'Same Day', 'Delivered', 3200.00, 0.00, 900.00),
(1006, 4, '2025-01-25', '2025-01-30', 'Standard Class', 'Delivered', 2450.00, 0.05, 680.00);

-- Inserir Pedidos - Fevereiro 2025
INSERT INTO analytics.orders (order_id, customer_id, order_date, ship_date, ship_mode, status, total_amount, discount, profit) VALUES
(1007, 6, '2025-02-02', '2025-02-07', 'Standard Class', 'Delivered', 5200.00, 0.00, 1450.00),
(1008, 8, '2025-02-05', '2025-02-08', 'Second Class', 'Delivered', 1850.00, 0.00, 510.00),
(1009, 10, '2025-02-10', '2025-02-12', 'First Class', 'Delivered', 4100.00, 0.08, 1150.00),
(1010, 9, '2025-02-14', '2025-02-19', 'Standard Class', 'Delivered', 2980.00, 0.00, 830.00),
(1011, 11, '2025-02-18', '2025-02-20', 'Same Day', 'Delivered', 7500.00, 0.12, 2100.00),
(1012, 12, '2025-02-22', '2025-02-27', 'Standard Class', 'Delivered', 1620.00, 0.00, 450.00),
(1013, 1, '2025-02-25', '2025-02-28', 'Second Class', 'Delivered', 3350.00, 0.05, 940.00);

-- Inserir Pedidos - Março 2025
INSERT INTO analytics.orders (order_id, customer_id, order_date, ship_date, ship_mode, status, total_amount, discount, profit) VALUES
(1014, 3, '2025-03-01', '2025-03-06', 'Standard Class', 'Delivered', 4800.00, 0.00, 1340.00),
(1015, 13, '2025-03-05', '2025-03-08', 'First Class', 'Delivered', 2100.00, 0.00, 590.00),
(1016, 14, '2025-03-10', '2025-03-15', 'Standard Class', 'Delivered', 5650.00, 0.10, 1580.00),
(1017, 15, '2025-03-12', '2025-03-14', 'Same Day', 'Delivered', 8200.00, 0.08, 2300.00),
(1018, 2, '2025-03-18', '2025-03-23', 'Standard Class', 'Delivered', 1950.00, 0.00, 545.00),
(1019, 5, '2025-03-22', '2025-03-25', 'Second Class', 'Delivered', 3780.00, 0.05, 1060.00),
(1020, 7, '2025-03-28', '2025-03-30', 'First Class', 'Delivered', 6100.00, 0.00, 1710.00);

-- Inserir Pedidos - Abril 2025
INSERT INTO analytics.orders (order_id, customer_id, order_date, ship_date, ship_mode, status, total_amount, discount, profit) VALUES
(1021, 4, '2025-04-02', '2025-04-07', 'Standard Class', 'Delivered', 2850.00, 0.00, 800.00),
(1022, 6, '2025-04-05', '2025-04-08', 'Second Class', 'Delivered', 4200.00, 0.05, 1180.00),
(1023, 8, '2025-04-10', '2025-04-12', 'Same Day', 'Delivered', 9500.00, 0.15, 2660.00),
(1024, 10, '2025-04-15', '2025-04-20', 'Standard Class', 'Delivered', 3100.00, 0.00, 870.00),
(1025, 9, '2025-04-18', '2025-04-21', 'First Class', 'Delivered', 5800.00, 0.08, 1625.00),
(1026, 11, '2025-04-22', '2025-04-27', 'Standard Class', 'Delivered', 2450.00, 0.00, 685.00),
(1027, 12, '2025-04-25', '2025-04-28', 'Second Class', 'Delivered', 7200.00, 0.10, 2015.00);

-- Inserir Pedidos - Maio 2025
INSERT INTO analytics.orders (order_id, customer_id, order_date, ship_date, ship_mode, status, total_amount, discount, profit) VALUES
(1028, 1, '2025-05-02', '2025-05-07', 'Standard Class', 'Delivered', 4100.00, 0.00, 1150.00),
(1029, 3, '2025-05-05', '2025-05-08', 'First Class', 'Delivered', 6800.00, 0.12, 1905.00),
(1030, 13, '2025-05-10', '2025-05-15', 'Standard Class', 'Delivered', 2580.00, 0.00, 725.00),
(1031, 14, '2025-05-12', '2025-05-14', 'Same Day', 'Delivered', 8900.00, 0.10, 2495.00),
(1032, 15, '2025-05-18', '2025-05-23', 'Standard Class', 'Delivered', 3650.00, 0.05, 1025.00),
(1033, 2, '2025-05-22', '2025-05-25', 'Second Class', 'Delivered', 5200.00, 0.00, 1460.00),
(1034, 5, '2025-05-28', '2025-05-30', 'First Class', 'Delivered', 1980.00, 0.00, 555.00);

-- Inserir Pedidos - Junho 2025
INSERT INTO analytics.orders (order_id, customer_id, order_date, ship_date, ship_mode, status, total_amount, discount, profit) VALUES
(1035, 7, '2025-06-01', '2025-06-06', 'Standard Class', 'Delivered', 7500.00, 0.08, 2100.00),
(1036, 4, '2025-06-05', '2025-06-08', 'Second Class', 'Delivered', 4350.00, 0.05, 1220.00),
(1037, 6, '2025-06-10', '2025-06-12', 'Same Day', 'Delivered', 10200.00, 0.15, 2855.00),
(1038, 8, '2025-06-15', '2025-06-20', 'Standard Class', 'Delivered', 2900.00, 0.00, 815.00),
(1039, 10, '2025-06-18', '2025-06-21', 'First Class', 'Delivered', 5650.00, 0.10, 1585.00),
(1040, 9, '2025-06-22', '2025-06-27', 'Standard Class', 'Delivered', 3800.00, 0.00, 1065.00),
(1041, 11, '2025-06-25', '2025-06-28', 'Second Class', 'Delivered', 6400.00, 0.08, 1795.00),
(1042, 12, '2025-06-28', '2025-06-30', 'First Class', 'Delivered', 8100.00, 0.12, 2270.00);

-- Inserir Pedidos - Julho 2025
INSERT INTO analytics.orders (order_id, customer_id, order_date, ship_date, ship_mode, status, total_amount, discount, profit) VALUES
(1043, 1, '2025-07-02', '2025-07-07', 'Standard Class', 'Delivered', 5200.00, 0.00, 1460.00),
(1044, 3, '2025-07-05', '2025-07-08', 'Second Class', 'Delivered', 3950.00, 0.05, 1110.00),
(1045, 13, '2025-07-10', '2025-07-12', 'Same Day', 'Delivered', 11500.00, 0.18, 3225.00),
(1046, 14, '2025-07-15', '2025-07-20', 'Standard Class', 'Delivered', 2650.00, 0.00, 745.00),
(1047, 15, '2025-07-18', '2025-07-21', 'First Class', 'Delivered', 7800.00, 0.10, 2185.00),
(1048, 2, '2025-07-22', '2025-07-27', 'Standard Class', 'Delivered', 4100.00, 0.05, 1150.00),
(1049, 5, '2025-07-25', '2025-07-28', 'Second Class', 'Delivered', 6200.00, 0.08, 1740.00);

-- Inserir Pedidos - Agosto 2025
INSERT INTO analytics.orders (order_id, customer_id, order_date, ship_date, ship_mode, status, total_amount, discount, profit) VALUES
(1050, 7, '2025-08-01', '2025-08-06', 'Standard Class', 'Delivered', 8500.00, 0.12, 2380.00),
(1051, 4, '2025-08-05', '2025-08-08', 'First Class', 'Delivered', 3200.00, 0.00, 900.00),
(1052, 6, '2025-08-10', '2025-08-12', 'Same Day', 'Delivered', 9800.00, 0.15, 2745.00),
(1053, 8, '2025-08-15', '2025-08-20', 'Standard Class', 'Delivered', 4650.00, 0.05, 1305.00),
(1054, 10, '2025-08-18', '2025-08-21', 'Second Class', 'Delivered', 5900.00, 0.08, 1655.00),
(1055, 9, '2025-08-22', '2025-08-27', 'Standard Class', 'Delivered', 2100.00, 0.00, 590.00),
(1056, 11, '2025-08-25', '2025-08-28', 'First Class', 'Delivered', 7400.00, 0.10, 2075.00),
(1057, 12, '2025-08-28', '2025-08-30', 'Same Day', 'Delivered', 12500.00, 0.20, 3500.00);

-- Inserir Pedidos - Setembro 2025
INSERT INTO analytics.orders (order_id, customer_id, order_date, ship_date, ship_mode, status, total_amount, discount, profit) VALUES
(1058, 1, '2025-09-02', '2025-09-07', 'Standard Class', 'Delivered', 6200.00, 0.08, 1740.00),
(1059, 3, '2025-09-05', '2025-09-08', 'Second Class', 'Delivered', 4800.00, 0.05, 1345.00),
(1060, 13, '2025-09-10', '2025-09-15', 'Standard Class', 'Delivered', 3500.00, 0.00, 980.00),
(1061, 14, '2025-09-12', '2025-09-14', 'First Class', 'Delivered', 8900.00, 0.12, 2495.00),
(1062, 15, '2025-09-18', '2025-09-23', 'Standard Class', 'Delivered', 5100.00, 0.05, 1430.00),
(1063, 2, '2025-09-22', '2025-09-25', 'Same Day', 'Delivered', 10800.00, 0.15, 3025.00),
(1064, 5, '2025-09-28', '2025-09-30', 'Second Class', 'Delivered', 2850.00, 0.00, 800.00);

-- Inserir Pedidos - Outubro 2025
INSERT INTO analytics.orders (order_id, customer_id, order_date, ship_date, ship_mode, status, total_amount, discount, profit) VALUES
(1065, 7, '2025-10-02', '2025-10-07', 'Standard Class', 'Delivered', 7200.00, 0.10, 2015.00),
(1066, 4, '2025-10-05', '2025-10-08', 'First Class', 'Delivered', 4500.00, 0.05, 1260.00),
(1067, 6, '2025-10-10', '2025-10-15', 'Standard Class', 'Delivered', 9500.00, 0.12, 2660.00),
(1068, 8, '2025-10-12', '2025-10-14', 'Same Day', 'Delivered', 13200.00, 0.18, 3695.00),
(1069, 10, '2025-10-18', '2025-10-23', 'Standard Class', 'Delivered', 3800.00, 0.00, 1065.00),
(1070, 9, '2025-10-22', '2025-10-25', 'Second Class', 'Delivered', 6100.00, 0.08, 1710.00),
(1071, 11, '2025-10-28', '2025-10-30', 'First Class', 'Delivered', 8500.00, 0.10, 2380.00);

-- Inserir Pedidos - Novembro 2025
INSERT INTO analytics.orders (order_id, customer_id, order_date, ship_date, ship_mode, status, total_amount, discount, profit) VALUES
(1072, 12, '2025-11-01', '2025-11-06', 'Standard Class', 'Delivered', 5800.00, 0.05, 1625.00),
(1073, 1, '2025-11-05', '2025-11-08', 'Second Class', 'Delivered', 10500.00, 0.15, 2940.00),
(1074, 3, '2025-11-10', '2025-11-12', 'Same Day', 'Delivered', 14500.00, 0.20, 4060.00),
(1075, 13, '2025-11-15', '2025-11-20', 'Standard Class', 'Delivered', 4200.00, 0.00, 1180.00),
(1076, 14, '2025-11-18', '2025-11-21', 'First Class', 'Delivered', 7800.00, 0.10, 2185.00),
(1077, 15, '2025-11-22', '2025-11-27', 'Standard Class', 'Delivered', 6500.00, 0.08, 1820.00),
(1078, 2, '2025-11-25', '2025-11-28', 'Second Class', 'Delivered', 9200.00, 0.12, 2575.00),
(1079, 5, '2025-11-28', '2025-11-30', 'First Class', 'Delivered', 11800.00, 0.15, 3305.00);

-- Inserir Pedidos - Dezembro 2025
INSERT INTO analytics.orders (order_id, customer_id, order_date, ship_date, ship_mode, status, total_amount, discount, profit) VALUES
(1080, 7, '2025-12-01', '2025-12-06', 'Standard Class', 'Shipped', 8200.00, 0.10, 2295.00),
(1081, 4, '2025-12-03', '2025-12-08', 'Second Class', 'Processing', 5500.00, 0.05, 1540.00),
(1082, 6, '2025-12-05', '2025-12-10', 'Standard Class', 'Processing', 12500.00, 0.18, 3500.00),
(1083, 8, '2025-12-08', '2025-12-10', 'Same Day', 'Pending', 15800.00, 0.20, 4425.00),
(1084, 10, '2025-12-10', '2025-12-15', 'Standard Class', 'Pending', 4800.00, 0.00, 1345.00);

-- Inserir Itens dos Pedidos
INSERT INTO analytics.order_items (item_id, order_id, product_id, quantity, unit_price, discount, total) VALUES
(1, 1001, 1, 1, 4500.00, 0.00, 4500.00),
(2, 1001, 4, 2, 225.00, 0.00, 450.00),
(3, 1002, 2, 1, 2200.00, 0.05, 2090.00),
(4, 1002, 3, 1, 450.00, 0.05, 427.50),
(5, 1003, 1, 1, 4500.00, 0.10, 4050.00),
(6, 1003, 2, 1, 2200.00, 0.10, 1980.00),
(7, 1004, 5, 1, 1800.00, 0.00, 1800.00),
(8, 1004, 14, 1, 180.00, 0.00, 180.00),
(9, 1005, 6, 2, 1200.00, 0.00, 2400.00),
(10, 1005, 13, 4, 200.00, 0.00, 800.00),
(11, 1006, 8, 3, 550.00, 0.05, 1567.50),
(12, 1006, 10, 5, 180.00, 0.05, 855.00),
(13, 1007, 1, 1, 4500.00, 0.00, 4500.00),
(14, 1007, 9, 1, 650.00, 0.00, 650.00),
(15, 1008, 5, 1, 1800.00, 0.00, 1800.00),
(16, 1009, 1, 1, 4500.00, 0.08, 4140.00),
(17, 1010, 6, 2, 1200.00, 0.00, 2400.00),
(18, 1010, 15, 5, 120.00, 0.00, 600.00);

-- Inserir métricas diárias agregadas
INSERT INTO analytics.daily_metrics (date, total_orders, total_revenue, total_profit, new_customers, avg_order_value)
SELECT 
    order_date as date,
    count() as total_orders,
    sum(total_amount) as total_revenue,
    sum(profit) as total_profit,
    0 as new_customers,
    avg(total_amount) as avg_order_value
FROM analytics.orders
GROUP BY order_date
ORDER BY order_date;
