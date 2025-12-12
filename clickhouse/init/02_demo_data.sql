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

-- Inserir Itens dos Pedidos - Janeiro 2025
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
(12, 1006, 10, 5, 180.00, 0.05, 855.00);

-- Inserir Itens dos Pedidos - Fevereiro 2025
INSERT INTO analytics.order_items (item_id, order_id, product_id, quantity, unit_price, discount, total) VALUES
(13, 1007, 1, 1, 4500.00, 0.00, 4500.00),
(14, 1007, 9, 1, 650.00, 0.00, 650.00),
(15, 1008, 5, 1, 1800.00, 0.00, 1800.00),
(16, 1009, 1, 1, 4500.00, 0.08, 4140.00),
(17, 1010, 6, 2, 1200.00, 0.00, 2400.00),
(18, 1010, 15, 5, 120.00, 0.00, 600.00),
(19, 1011, 1, 1, 4500.00, 0.12, 3960.00),
(20, 1011, 2, 1, 2200.00, 0.12, 1936.00),
(21, 1011, 8, 3, 550.00, 0.12, 1452.00),
(22, 1012, 5, 1, 1800.00, 0.00, 1800.00),
(23, 1013, 6, 2, 1200.00, 0.05, 2280.00),
(24, 1013, 13, 5, 220.00, 0.05, 1045.00);

-- Inserir Itens dos Pedidos - Março 2025
INSERT INTO analytics.order_items (item_id, order_id, product_id, quantity, unit_price, discount, total) VALUES
(25, 1014, 1, 1, 4500.00, 0.00, 4500.00),
(26, 1015, 5, 1, 1800.00, 0.00, 1800.00),
(27, 1015, 14, 2, 180.00, 0.00, 360.00),
(28, 1016, 1, 1, 4500.00, 0.10, 4050.00),
(29, 1016, 8, 3, 550.00, 0.10, 1485.00),
(30, 1017, 1, 1, 4500.00, 0.08, 4140.00),
(31, 1017, 2, 1, 2200.00, 0.08, 2024.00),
(32, 1017, 5, 1, 1800.00, 0.08, 1656.00),
(33, 1018, 6, 1, 1200.00, 0.00, 1200.00),
(34, 1018, 12, 2, 450.00, 0.00, 900.00),
(35, 1019, 2, 1, 2200.00, 0.05, 2090.00),
(36, 1019, 3, 1, 450.00, 0.05, 427.50),
(37, 1019, 8, 2, 550.00, 0.05, 1045.00),
(38, 1020, 1, 1, 4500.00, 0.00, 4500.00),
(39, 1020, 9, 2, 650.00, 0.00, 1300.00);

-- Inserir Itens dos Pedidos - Abril 2025
INSERT INTO analytics.order_items (item_id, order_id, product_id, quantity, unit_price, discount, total) VALUES
(40, 1021, 5, 1, 1800.00, 0.00, 1800.00),
(41, 1021, 13, 5, 220.00, 0.00, 1100.00),
(42, 1022, 2, 1, 2200.00, 0.05, 2090.00),
(43, 1022, 8, 3, 550.00, 0.05, 1567.50),
(44, 1022, 10, 3, 180.00, 0.05, 513.00),
(45, 1023, 1, 2, 4500.00, 0.15, 7650.00),
(46, 1023, 3, 2, 450.00, 0.15, 765.00),
(47, 1023, 4, 4, 250.00, 0.15, 850.00),
(48, 1024, 6, 2, 1200.00, 0.00, 2400.00),
(49, 1024, 15, 6, 120.00, 0.00, 720.00),
(50, 1025, 1, 1, 4500.00, 0.08, 4140.00),
(51, 1025, 9, 2, 650.00, 0.08, 1196.00),
(52, 1026, 5, 1, 1800.00, 0.00, 1800.00),
(53, 1026, 14, 4, 180.00, 0.00, 720.00),
(54, 1027, 1, 1, 4500.00, 0.10, 4050.00),
(55, 1027, 2, 1, 2200.00, 0.10, 1980.00),
(56, 1027, 8, 2, 550.00, 0.10, 990.00);

-- Inserir Itens dos Pedidos - Maio 2025
INSERT INTO analytics.order_items (item_id, order_id, product_id, quantity, unit_price, discount, total) VALUES
(57, 1028, 2, 1, 2200.00, 0.00, 2200.00),
(58, 1028, 8, 3, 550.00, 0.00, 1650.00),
(59, 1029, 1, 1, 4500.00, 0.12, 3960.00),
(60, 1029, 5, 1, 1800.00, 0.12, 1584.00),
(61, 1029, 9, 2, 650.00, 0.12, 1144.00),
(62, 1030, 6, 1, 1200.00, 0.00, 1200.00),
(63, 1030, 12, 3, 450.00, 0.00, 1350.00),
(64, 1031, 1, 2, 4500.00, 0.10, 8100.00),
(65, 1031, 4, 3, 250.00, 0.10, 675.00),
(66, 1032, 5, 1, 1800.00, 0.05, 1710.00),
(67, 1032, 6, 1, 1200.00, 0.05, 1140.00),
(68, 1032, 13, 4, 220.00, 0.05, 836.00),
(69, 1033, 1, 1, 4500.00, 0.00, 4500.00),
(70, 1033, 10, 4, 180.00, 0.00, 720.00),
(71, 1034, 5, 1, 1800.00, 0.00, 1800.00),
(72, 1034, 14, 1, 180.00, 0.00, 180.00);

-- Inserir Itens dos Pedidos - Junho 2025
INSERT INTO analytics.order_items (item_id, order_id, product_id, quantity, unit_price, discount, total) VALUES
(73, 1035, 1, 1, 4500.00, 0.08, 4140.00),
(74, 1035, 2, 1, 2200.00, 0.08, 2024.00),
(75, 1035, 9, 2, 650.00, 0.08, 1196.00),
(76, 1036, 6, 2, 1200.00, 0.05, 2280.00),
(77, 1036, 5, 1, 1800.00, 0.05, 1710.00),
(78, 1037, 1, 2, 4500.00, 0.15, 7650.00),
(79, 1037, 8, 4, 550.00, 0.15, 1870.00),
(80, 1038, 5, 1, 1800.00, 0.00, 1800.00),
(81, 1038, 12, 2, 450.00, 0.00, 900.00),
(82, 1039, 1, 1, 4500.00, 0.10, 4050.00),
(83, 1039, 3, 2, 450.00, 0.10, 810.00),
(84, 1039, 4, 3, 250.00, 0.10, 675.00),
(85, 1040, 6, 2, 1200.00, 0.00, 2400.00),
(86, 1040, 13, 6, 220.00, 0.00, 1320.00),
(87, 1041, 1, 1, 4500.00, 0.08, 4140.00),
(88, 1041, 8, 3, 550.00, 0.08, 1518.00),
(89, 1041, 10, 4, 180.00, 0.08, 662.40),
(90, 1042, 1, 1, 4500.00, 0.12, 3960.00),
(91, 1042, 2, 1, 2200.00, 0.12, 1936.00),
(92, 1042, 5, 1, 1800.00, 0.12, 1584.00);

-- Inserir Itens dos Pedidos - Julho 2025
INSERT INTO analytics.order_items (item_id, order_id, product_id, quantity, unit_price, discount, total) VALUES
(93, 1043, 1, 1, 4500.00, 0.00, 4500.00),
(94, 1043, 9, 1, 650.00, 0.00, 650.00),
(95, 1044, 5, 1, 1800.00, 0.05, 1710.00),
(96, 1044, 6, 1, 1200.00, 0.05, 1140.00),
(97, 1044, 13, 5, 220.00, 0.05, 1045.00),
(98, 1045, 1, 2, 4500.00, 0.18, 7380.00),
(99, 1045, 2, 1, 2200.00, 0.18, 1804.00),
(100, 1045, 8, 4, 550.00, 0.18, 1804.00),
(101, 1046, 6, 1, 1200.00, 0.00, 1200.00),
(102, 1046, 12, 3, 450.00, 0.00, 1350.00),
(103, 1047, 1, 1, 4500.00, 0.10, 4050.00),
(104, 1047, 5, 1, 1800.00, 0.10, 1620.00),
(105, 1047, 8, 3, 550.00, 0.10, 1485.00),
(106, 1048, 2, 1, 2200.00, 0.05, 2090.00),
(107, 1048, 9, 2, 650.00, 0.05, 1235.00),
(108, 1048, 10, 4, 180.00, 0.05, 684.00),
(109, 1049, 1, 1, 4500.00, 0.08, 4140.00),
(110, 1049, 6, 1, 1200.00, 0.08, 1104.00),
(111, 1049, 13, 4, 220.00, 0.08, 809.60);

-- Inserir Itens dos Pedidos - Agosto 2025
INSERT INTO analytics.order_items (item_id, order_id, product_id, quantity, unit_price, discount, total) VALUES
(112, 1050, 1, 1, 4500.00, 0.12, 3960.00),
(113, 1050, 2, 1, 2200.00, 0.12, 1936.00),
(114, 1050, 5, 1, 1800.00, 0.12, 1584.00),
(115, 1050, 9, 1, 650.00, 0.12, 572.00),
(116, 1051, 6, 2, 1200.00, 0.00, 2400.00),
(117, 1051, 13, 4, 220.00, 0.00, 880.00),
(118, 1052, 1, 2, 4500.00, 0.15, 7650.00),
(119, 1052, 8, 3, 550.00, 0.15, 1402.50),
(120, 1052, 10, 4, 180.00, 0.15, 612.00),
(121, 1053, 5, 2, 1800.00, 0.05, 3420.00),
(122, 1053, 14, 6, 180.00, 0.05, 1026.00),
(123, 1054, 1, 1, 4500.00, 0.08, 4140.00),
(124, 1054, 3, 2, 450.00, 0.08, 828.00),
(125, 1054, 4, 3, 250.00, 0.08, 690.00),
(126, 1055, 6, 1, 1200.00, 0.00, 1200.00),
(127, 1055, 12, 2, 450.00, 0.00, 900.00),
(128, 1056, 1, 1, 4500.00, 0.10, 4050.00),
(129, 1056, 2, 1, 2200.00, 0.10, 1980.00),
(130, 1056, 9, 2, 650.00, 0.10, 1170.00),
(131, 1057, 1, 2, 4500.00, 0.20, 7200.00),
(132, 1057, 5, 2, 1800.00, 0.20, 2880.00),
(133, 1057, 8, 4, 550.00, 0.20, 1760.00);

-- Inserir Itens dos Pedidos - Setembro 2025
INSERT INTO analytics.order_items (item_id, order_id, product_id, quantity, unit_price, discount, total) VALUES
(134, 1058, 1, 1, 4500.00, 0.08, 4140.00),
(135, 1058, 8, 3, 550.00, 0.08, 1518.00),
(136, 1058, 10, 3, 180.00, 0.08, 496.80),
(137, 1059, 2, 1, 2200.00, 0.05, 2090.00),
(138, 1059, 5, 1, 1800.00, 0.05, 1710.00),
(139, 1059, 13, 4, 220.00, 0.05, 836.00),
(140, 1060, 6, 2, 1200.00, 0.00, 2400.00),
(141, 1060, 12, 2, 450.00, 0.00, 900.00),
(142, 1061, 1, 1, 4500.00, 0.12, 3960.00),
(143, 1061, 2, 1, 2200.00, 0.12, 1936.00),
(144, 1061, 5, 1, 1800.00, 0.12, 1584.00),
(145, 1061, 9, 2, 650.00, 0.12, 1144.00),
(146, 1062, 5, 2, 1800.00, 0.05, 3420.00),
(147, 1062, 14, 8, 180.00, 0.05, 1368.00),
(148, 1063, 1, 2, 4500.00, 0.15, 7650.00),
(149, 1063, 8, 5, 550.00, 0.15, 2337.50),
(150, 1063, 10, 4, 180.00, 0.15, 612.00),
(151, 1064, 6, 1, 1200.00, 0.00, 1200.00),
(152, 1064, 5, 1, 1800.00, 0.00, 1800.00);

-- Inserir Itens dos Pedidos - Outubro 2025
INSERT INTO analytics.order_items (item_id, order_id, product_id, quantity, unit_price, discount, total) VALUES
(153, 1065, 1, 1, 4500.00, 0.10, 4050.00),
(154, 1065, 5, 1, 1800.00, 0.10, 1620.00),
(155, 1065, 9, 2, 650.00, 0.10, 1170.00),
(156, 1066, 2, 1, 2200.00, 0.05, 2090.00),
(157, 1066, 8, 3, 550.00, 0.05, 1567.50),
(158, 1066, 10, 4, 180.00, 0.05, 684.00),
(159, 1067, 1, 2, 4500.00, 0.12, 7920.00),
(160, 1067, 3, 2, 450.00, 0.12, 792.00),
(161, 1067, 4, 3, 250.00, 0.12, 660.00),
(162, 1068, 1, 2, 4500.00, 0.18, 7380.00),
(163, 1068, 2, 2, 2200.00, 0.18, 3608.00),
(164, 1068, 8, 4, 550.00, 0.18, 1804.00),
(165, 1069, 5, 2, 1800.00, 0.00, 3600.00),
(166, 1069, 14, 1, 180.00, 0.00, 180.00),
(167, 1070, 1, 1, 4500.00, 0.08, 4140.00),
(168, 1070, 6, 1, 1200.00, 0.08, 1104.00),
(169, 1070, 13, 4, 220.00, 0.08, 809.60),
(170, 1071, 1, 1, 4500.00, 0.10, 4050.00),
(171, 1071, 2, 1, 2200.00, 0.10, 1980.00),
(172, 1071, 5, 1, 1800.00, 0.10, 1620.00);

-- Inserir Itens dos Pedidos - Novembro 2025
INSERT INTO analytics.order_items (item_id, order_id, product_id, quantity, unit_price, discount, total) VALUES
(173, 1072, 1, 1, 4500.00, 0.05, 4275.00),
(174, 1072, 9, 2, 650.00, 0.05, 1235.00),
(175, 1073, 1, 2, 4500.00, 0.15, 7650.00),
(176, 1073, 5, 1, 1800.00, 0.15, 1530.00),
(177, 1073, 8, 2, 550.00, 0.15, 935.00),
(178, 1074, 1, 2, 4500.00, 0.20, 7200.00),
(179, 1074, 2, 2, 2200.00, 0.20, 3520.00),
(180, 1074, 5, 2, 1800.00, 0.20, 2880.00),
(181, 1075, 6, 2, 1200.00, 0.00, 2400.00),
(182, 1075, 12, 4, 450.00, 0.00, 1800.00),
(183, 1076, 1, 1, 4500.00, 0.10, 4050.00),
(184, 1076, 2, 1, 2200.00, 0.10, 1980.00),
(185, 1076, 8, 3, 550.00, 0.10, 1485.00),
(186, 1077, 1, 1, 4500.00, 0.08, 4140.00),
(187, 1077, 9, 2, 650.00, 0.08, 1196.00),
(188, 1077, 10, 6, 180.00, 0.08, 993.60),
(189, 1078, 1, 1, 4500.00, 0.12, 3960.00),
(190, 1078, 2, 1, 2200.00, 0.12, 1936.00),
(191, 1078, 5, 2, 1800.00, 0.12, 3168.00),
(192, 1079, 1, 2, 4500.00, 0.15, 7650.00),
(193, 1079, 5, 1, 1800.00, 0.15, 1530.00),
(194, 1079, 8, 4, 550.00, 0.15, 1870.00);

-- Inserir Itens dos Pedidos - Dezembro 2025
INSERT INTO analytics.order_items (item_id, order_id, product_id, quantity, unit_price, discount, total) VALUES
(195, 1080, 1, 1, 4500.00, 0.10, 4050.00),
(196, 1080, 5, 1, 1800.00, 0.10, 1620.00),
(197, 1080, 8, 3, 550.00, 0.10, 1485.00),
(198, 1080, 13, 5, 220.00, 0.10, 990.00),
(199, 1081, 2, 1, 2200.00, 0.05, 2090.00),
(200, 1081, 6, 2, 1200.00, 0.05, 2280.00),
(201, 1081, 12, 2, 450.00, 0.05, 855.00),
(202, 1082, 1, 2, 4500.00, 0.18, 7380.00),
(203, 1082, 2, 1, 2200.00, 0.18, 1804.00),
(204, 1082, 5, 2, 1800.00, 0.18, 2952.00),
(205, 1083, 1, 3, 4500.00, 0.20, 10800.00),
(206, 1083, 2, 1, 2200.00, 0.20, 1760.00),
(207, 1083, 8, 5, 550.00, 0.20, 2200.00),
(208, 1083, 10, 5, 180.00, 0.20, 720.00),
(209, 1084, 5, 2, 1800.00, 0.00, 3600.00),
(210, 1084, 14, 6, 180.00, 0.00, 1080.00);

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
