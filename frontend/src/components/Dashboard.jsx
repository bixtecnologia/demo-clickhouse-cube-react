import React, { useState, useMemo } from 'react';
import { useCubeQuery } from '@cubejs-client/react';
import KPICard from './KPICard';
import ChartCard from './ChartCard';
import Filters from './Filters';
import RevenueChart from './RevenueChart';
import StatusChart from './StatusChart';
import SegmentChart from './SegmentChart';
import CategorySalesChart from './CategorySalesChart';
import StateSalesChart from './StateSalesChart';
import ShipModeChart from './ShipModeChart';
import OrdersTable from './OrdersTable';
import './Dashboard.css';

const Dashboard = () => {
  const [filters, setFilters] = useState({
    dateRange: 'last30',
    segment: 'all',
    status: 'all',
  });

  // Helper to get date range for filters
  const getDateFilter = (range) => {
    switch (range) {
      case 'last30':
        return ['2025-11-11', '2025-12-11'];
      case 'last90':
        return ['2025-09-11', '2025-12-11'];
      case 'last180':
        return ['2025-06-11', '2025-12-11'];
      case '2025-Q1':
        return ['2025-01-01', '2025-03-31'];
      case '2025-Q2':
        return ['2025-04-01', '2025-06-30'];
      case '2025-Q3':
        return ['2025-07-01', '2025-09-30'];
      case '2025-Q4':
        return ['2025-10-01', '2025-12-31'];
      default:
        return ['2025-01-01', '2025-12-31']; // Full year for 'all'
    }
  };

  // Build KPI query with filters
  const kpiQuery = useMemo(() => {
    const dateFilter = getDateFilter(filters.dateRange);
    
    const query = {
      measures: [
        'Orders.count',
        'Orders.totalRevenue',
        'Orders.totalProfit',
        'Orders.averageOrderValue'
      ],
      timeDimensions: [{
        dimension: 'Orders.orderDate',
        dateRange: dateFilter,
      }],
    };

    const queryFilters = [];

    if (filters.status !== 'all') {
      queryFilters.push({
        dimension: 'Orders.status',
        operator: 'equals',
        values: [filters.status],
      });
    }

    if (filters.segment !== 'all') {
      queryFilters.push({
        dimension: 'Customers.segment',
        operator: 'equals',
        values: [filters.segment],
      });
    }

    if (queryFilters.length > 0) {
      query.filters = queryFilters;
    }

    return query;
  }, [filters]);

  // Build comparison query for trends (previous period)
  const comparisonQuery = useMemo(() => {
    const query = {
      measures: [
        'Orders.count',
        'Orders.totalRevenue',
        'Orders.totalProfit',
        'Orders.averageOrderValue'
      ],
    };

    // Compare with previous equivalent period
    const getPreviousPeriod = () => {
      switch (filters.dateRange) {
        case 'last30':
          return ['2025-10-11', '2025-11-10'];
        case 'last90':
          return ['2025-06-11', '2025-09-10'];
        case 'last180':
          return ['2025-01-01', '2025-06-10'];
        case '2025-Q1':
          return ['2024-10-01', '2024-12-31'];
        case '2025-Q2':
          return ['2025-01-01', '2025-03-31'];
        case '2025-Q3':
          return ['2025-04-01', '2025-06-30'];
        case '2025-Q4':
          return ['2025-07-01', '2025-09-30'];
        default:
          return ['2024-01-01', '2024-12-31']; // Previous year
      }
    };

    const prevPeriod = getPreviousPeriod();
    query.timeDimensions = [{
      dimension: 'Orders.orderDate',
      dateRange: prevPeriod,
    }];

    const queryFilters = [];
    if (filters.status !== 'all') {
      queryFilters.push({
        dimension: 'Orders.status',
        operator: 'equals',
        values: [filters.status],
      });
    }
    if (filters.segment !== 'all') {
      queryFilters.push({
        dimension: 'Customers.segment',
        operator: 'equals',
        values: [filters.segment],
      });
    }
    if (queryFilters.length > 0) {
      query.filters = queryFilters;
    }

    return query;
  }, [filters]);

  // Query para KPIs principais
  const { resultSet: kpiData, isLoading: kpiLoading } = useCubeQuery(kpiQuery);
  const { resultSet: comparisonData } = useCubeQuery(comparisonQuery);

  // Query para clientes únicos
  const customersQuery = useMemo(() => {
    const query = {
      measures: ['Customers.count'],
    };

    if (filters.segment !== 'all') {
      query.filters = [{
        dimension: 'Customers.segment',
        operator: 'equals',
        values: [filters.segment],
      }];
    }

    return query;
  }, [filters]);

  const { resultSet: customersData } = useCubeQuery(customersQuery);

  const getKPIValues = () => {
    if (!kpiData) return { orders: 0, revenue: 0, profit: 0, avgOrder: 0 };
    const data = kpiData.tablePivot()[0] || {};
    return {
      orders: data['Orders.count'] || 0,
      revenue: data['Orders.totalRevenue'] || 0,
      profit: data['Orders.totalProfit'] || 0,
      avgOrder: data['Orders.averageOrderValue'] || 0,
    };
  };

  const getComparisonValues = () => {
    if (!comparisonData) return { orders: 0, revenue: 0, profit: 0, avgOrder: 0 };
    const data = comparisonData.tablePivot()[0] || {};
    return {
      orders: data['Orders.count'] || 0,
      revenue: data['Orders.totalRevenue'] || 0,
      profit: data['Orders.totalProfit'] || 0,
      avgOrder: data['Orders.averageOrderValue'] || 0,
    };
  };

  const calculateTrend = (current, previous) => {
    if (!previous || previous === 0) return { value: '—', up: true };
    const percentChange = ((current - previous) / previous) * 100;
    const formatted = percentChange > 0 
      ? `+${percentChange.toFixed(1)}%` 
      : `${percentChange.toFixed(1)}%`;
    return {
      value: formatted,
      up: percentChange >= 0,
    };
  };

  const getCustomersCount = () => {
    if (!customersData) return 0;
    const data = customersData.tablePivot()[0] || {};
    return data['Customers.count'] || 0;
  };

  const kpis = getKPIValues();
  const comparison = getComparisonValues();

  const trends = {
    orders: calculateTrend(kpis.orders, comparison.orders),
    revenue: calculateTrend(kpis.revenue, comparison.revenue),
    profit: calculateTrend(kpis.profit, comparison.profit),
    avgOrder: calculateTrend(kpis.avgOrder, comparison.avgOrder),
  };

  const formatCurrency = (value) => {
    return new Intl.NumberFormat('pt-BR', {
      style: 'currency',
      currency: 'BRL',
    }).format(value);
  };

  return (
    <div className="dashboard">
      {/* Filters */}
      <Filters filters={filters} onFilterChange={setFilters} />

      {/* KPI Cards */}
      <section className="kpi-section">
        <KPICard
          title="Total de Pedidos"
          value={kpis.orders.toLocaleString('pt-BR')}
          icon="📦"
          color="cyan"
          loading={kpiLoading}
          trend={trends.orders.value}
          trendUp={trends.orders.up}
        />
        <KPICard
          title="Receita Total"
          value={formatCurrency(kpis.revenue)}
          icon="💰"
          color="emerald"
          loading={kpiLoading}
          trend={trends.revenue.value}
          trendUp={trends.revenue.up}
        />
        <KPICard
          title="Lucro Total"
          value={formatCurrency(kpis.profit)}
          icon="📈"
          color="purple"
          loading={kpiLoading}
          trend={trends.profit.value}
          trendUp={trends.profit.up}
        />
        <KPICard
          title="Ticket Médio"
          value={formatCurrency(kpis.avgOrder)}
          icon="🎯"
          color="amber"
          loading={kpiLoading}
          trend={trends.avgOrder.value}
          trendUp={trends.avgOrder.up}
        />
        <KPICard
          title="Clientes"
          value={getCustomersCount().toLocaleString('pt-BR')}
          icon="👥"
          color="rose"
          loading={kpiLoading}
        />
      </section>

      {/* Charts Section - Row 1 */}
      <section className="charts-section">
        <ChartCard title="Evolução de Receita" subtitle="Receita vs Lucro ao longo do tempo" size="large">
          <RevenueChart filters={filters} />
        </ChartCard>
        
        <ChartCard title="Status dos Pedidos" subtitle="Distribuição atual">
          <StatusChart filters={filters} />
        </ChartCard>
        
        <ChartCard title="Receita por Segmento" subtitle="Por tipo de cliente">
          <SegmentChart filters={filters} />
        </ChartCard>
      </section>

      {/* Charts Section - Row 2 */}
      <section className="charts-section-secondary">
        <ChartCard title="Vendas por Categoria" subtitle="Volume de vendas">
          <CategorySalesChart filters={filters} />
        </ChartCard>
        
        <ChartCard title="Receita por Estado" subtitle="Top 7 estados">
          <StateSalesChart filters={filters} />
        </ChartCard>
        
        <ChartCard title="Modalidade de Envio" subtitle="Distribuição de pedidos">
          <ShipModeChart filters={filters} />
        </ChartCard>
      </section>

      {/* Orders Table */}
      <section className="table-section">
        <ChartCard title="Últimos Pedidos" subtitle="Detalhes dos pedidos recentes" size="full">
          <OrdersTable filters={filters} />
        </ChartCard>
      </section>
    </div>
  );
};

export default Dashboard;
