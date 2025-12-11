import React from 'react';
import { useCubeQuery } from '@cubejs-client/react';
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  Cell,
} from 'recharts';
import './Charts.css';

const COLORS = ['#00d4ff', '#a855f7', '#10b981', '#f59e0b', '#f43f5e'];

const CategorySalesChart = ({ filters }) => {
  const buildQuery = () => {
    const query = {
      measures: ['OrderItems.totalSales'],
      dimensions: ['Products.category'],
      order: {
        'OrderItems.totalSales': 'desc',
      },
      limit: 5,
    };

    if (filters?.dateRange && filters.dateRange !== 'all') {
      const dateFilter = getDateFilter(filters.dateRange);
      if (dateFilter) {
        query.timeDimensions = [{
          dimension: 'Orders.orderDate',
          dateRange: dateFilter,
        }];
      }
    }

    return query;
  };

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
        return null;
    }
  };

  const { resultSet, isLoading, error } = useCubeQuery(buildQuery());

  if (isLoading) {
    return <div className="chart-loading">Carregando...</div>;
  }

  if (error) {
    return <div className="chart-error">Erro ao carregar dados</div>;
  }

  const categoryLabels = {
    'Tecnologia': 'Tecnologia',
    'Móveis': 'Móveis',
    'Decoração': 'Decoração',
  };

  const data = resultSet?.tablePivot().map((row) => ({
    category: categoryLabels[row['Products.category']] || row['Products.category'],
    sales: parseFloat(row['OrderItems.totalSales']) || 0,
  })) || [];

  const formatCurrency = (value) => {
    if (value >= 1000) {
      return `R$ ${(value / 1000).toFixed(0)}K`;
    }
    return `R$ ${value}`;
  };

  const CustomTooltip = ({ active, payload, label }) => {
    if (active && payload && payload.length) {
      return (
        <div className="custom-tooltip">
          <p className="tooltip-label">{label}</p>
          <p className="tooltip-value" style={{ color: payload[0].payload.fill }}>
            {new Intl.NumberFormat('pt-BR', {
              style: 'currency',
              currency: 'BRL',
            }).format(payload[0].value)}
          </p>
        </div>
      );
    }
    return null;
  };

  return (
    <ResponsiveContainer width="100%" height={250}>
      <BarChart data={data} margin={{ top: 10, right: 30, left: 0, bottom: 0 }}>
        <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" />
        <XAxis
          dataKey="category"
          stroke="#64748b"
          fontSize={11}
          tickLine={false}
          axisLine={false}
        />
        <YAxis
          stroke="#64748b"
          fontSize={12}
          tickLine={false}
          axisLine={false}
          tickFormatter={formatCurrency}
        />
        <Tooltip content={<CustomTooltip />} cursor={{ fill: 'rgba(255,255,255,0.03)' }} />
        <Bar dataKey="sales" radius={[4, 4, 0, 0]} barSize={50}>
          {data.map((entry, index) => (
            <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
          ))}
        </Bar>
      </BarChart>
    </ResponsiveContainer>
  );
};

export default CategorySalesChart;


