# 📊 Analytics Dashboard

Um ambiente completo de analytics com **ClickHouse**, **Cube.js** e **React**, incluindo dados de demonstração.

![Stack](https://img.shields.io/badge/ClickHouse-FFCC01?style=flat&logo=clickhouse&logoColor=black)
![Stack](https://img.shields.io/badge/Cube.js-7A50FF?style=flat&logo=cube&logoColor=white)
![Stack](https://img.shields.io/badge/React-61DAFB?style=flat&logo=react&logoColor=black)
![Stack](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)

## 🚀 Início Rápido

### Pré-requisitos

- Docker Desktop instalado e rodando
- Docker Compose

### Executando o projeto

```powershell
# Clone ou navegue até o diretório do projeto
cd "D:\Dev Center\clinica leite"

# Inicie todos os serviços
docker-compose up -d

# Aguarde alguns segundos para os serviços iniciarem
# Verifique os logs se necessário
docker-compose logs -f
```

### Acessando os serviços

| Serviço | URL | Descrição |
|---------|-----|-----------|
| **Frontend** | http://localhost:3000 | Dashboard React |
| **Cube.js Playground** | http://localhost:4000 | Interface de desenvolvimento Cube.js |
| **ClickHouse HTTP** | http://localhost:8123 | Interface HTTP do ClickHouse |

## 🏗️ Arquitetura

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│  React Frontend │────▶│    Cube.js      │────▶│   ClickHouse    │
│   (port 3000)   │     │   (port 4000)   │     │   (port 8123)   │
│                 │     │                 │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘
```

## 📁 Estrutura do Projeto

```
clinica leite/
├── docker-compose.yml       # Orquestração dos containers
├── README.md
│
├── clickhouse/
│   └── init/
│       ├── 01_schema.sql    # Criação das tabelas
│       └── 02_demo_data.sql # Dados de demonstração
│
├── cubejs/
│   └── schema/
│       ├── Orders.js        # Modelo de Pedidos
│       ├── Customers.js     # Modelo de Clientes
│       ├── Products.js      # Modelo de Produtos
│       ├── OrderItems.js    # Modelo de Itens
│       └── DailyMetrics.js  # Métricas agregadas
│
└── frontend/
    ├── Dockerfile
    ├── package.json
    ├── public/
    │   └── index.html
    └── src/
        ├── index.js
        ├── index.css
        ├── App.js
        ├── App.css
        └── components/
            ├── Dashboard.js/.css
            ├── KPICard.js/.css
            ├── ChartCard.js/.css
            ├── RevenueChart.js
            ├── StatusChart.js
            ├── SegmentChart.js
            ├── TopProducts.js
            └── Charts.css
```

## 📊 Dados de Demonstração

O sistema vem com dados de demonstração incluindo:

- **15 Clientes** - divididos em segmentos Consumer, Corporate e Home Office
- **15 Produtos** - nas categorias Tecnologia, Móveis e Decoração
- **84 Pedidos** - distribuídos ao longo de 12 meses (Jan-Dez 2025)
- **Métricas Diárias** - agregações pré-calculadas

### Modelos de Dados (Cube.js)

| Modelo | Medidas | Dimensões |
|--------|---------|-----------|
| Orders | count, totalRevenue, totalProfit, averageOrderValue | orderDate, status, shipMode |
| Customers | count, uniqueCustomersWithOrders | segment, city, state |
| Products | count, averagePrice | category, subCategory, brand |
| OrderItems | totalQuantity, totalSales | orderId, productId |
| DailyMetrics | totalOrders, totalRevenue, totalProfit | date |

## 🛠️ Comandos Úteis

```powershell
# Iniciar todos os serviços
docker-compose up -d

# Ver logs de todos os serviços
docker-compose logs -f

# Ver logs de um serviço específico
docker-compose logs -f clickhouse
docker-compose logs -f cubejs
docker-compose logs -f frontend

# Parar todos os serviços
docker-compose down

# Parar e remover volumes (limpa dados)
docker-compose down -v

# Rebuild do frontend após alterações
docker-compose up -d --build frontend

# Acessar o ClickHouse via CLI
docker exec -it clickhouse clickhouse-client
```

### Queries SQL úteis no ClickHouse

```sql
-- Ver total de pedidos por mês
SELECT 
    toStartOfMonth(order_date) as month,
    count() as orders,
    sum(total_amount) as revenue
FROM analytics.orders
GROUP BY month
ORDER BY month;

-- Top clientes por receita
SELECT 
    c.customer_name,
    c.segment,
    sum(o.total_amount) as total_spent
FROM analytics.orders o
JOIN analytics.customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name, c.segment
ORDER BY total_spent DESC
LIMIT 10;
```

## 🎨 Personalização

### Alterando o tema do Frontend

Edite as variáveis CSS em `frontend/src/index.css`:

```css
:root {
  --accent-cyan: #00d4ff;    /* Cor principal */
  --accent-purple: #a855f7;   /* Cor secundária */
  --bg-primary: #0a0a0f;      /* Fundo principal */
  /* ... */
}
```

### Adicionando novos modelos no Cube.js

Crie um novo arquivo em `cubejs/schema/`:

```javascript
cube(`NovoCube`, {
  sql: `SELECT * FROM analytics.sua_tabela`,
  
  measures: {
    count: {
      type: `count`,
    },
  },
  
  dimensions: {
    id: {
      sql: `id`,
      type: `number`,
      primaryKey: true,
    },
  },
});
```

## 🔧 Troubleshooting

### ClickHouse não inicia
```powershell
# Verifique se a porta 8123 está livre
netstat -an | findstr 8123

# Veja os logs do container
docker-compose logs clickhouse
```

### Frontend não conecta ao Cube.js
```powershell
# Verifique se o Cube.js está rodando
curl http://localhost:4000/cubejs-api/v1

# Verifique as variáveis de ambiente
docker-compose exec frontend env | findstr REACT_APP
```

### Cube.js não conecta ao ClickHouse
```powershell
# Teste a conexão do ClickHouse
curl "http://localhost:8123/?query=SELECT%201"

# Verifique os logs
docker-compose logs cubejs
```

## 📝 Licença

Este projeto é apenas para fins de demonstração e aprendizado.



