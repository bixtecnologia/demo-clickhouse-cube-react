import React from 'react';
import { useCubeQuery } from '@cubejs-client/react';
import {
  AreaChart,
  Area,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  Legend,
} from 'recharts';
import './Charts.css';

const RevenueChart = ({ filters }) => {
  const buildQuery = () => {
    const dateFilter = getDateFilter(filters?.dateRange || 'all');
    const granularity = ['last30', 'last90'].includes(filters?.dateRange) ? 'week' : 'month';
    
    const query = {
      measures: ['Orders.totalRevenue', 'Orders.totalProfit'],
      timeDimensions: [
        {
          dimension: 'Orders.orderDate',
          granularity: granularity,
          dateRange: dateFilter,
        },
      ],
      order: {
        'Orders.orderDate': 'asc',
      },
    };

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
        return ['2025-01-01', '2025-12-31']; // Full year for 'all'
    }
  };

  const { resultSet, isLoading, error } = useCubeQuery(buildQuery());

  if (isLoading) {
    return <div className="chart-loading">Carregando...</div>;
  }

  if (error) {
    return <div className="chart-error">Erro ao carregar dados</div>;
  }

  const formatMonth = (dateStr) => {
    if (!dateStr) return '';
    const date = new Date(dateStr);
    return date.toLocaleDateString('pt-BR', {
      month: 'short',
      year: '2-digit',
    });
  };

  const data = resultSet?.tablePivot().map((row) => ({
    month: formatMonth(row['Orders.orderDate']),
    revenue: parseFloat(row['Orders.totalRevenue']) || 0,
    profit: parseFloat(row['Orders.totalProfit']) || 0,
  })) || [];

  const formatCurrency = (value) => {
    if (value >= 1000000) {
      return `R$ ${(value / 1000000).toFixed(1)}M`;
    }
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
          {payload.map((entry, index) => (
            <p key={index} className="tooltip-value" style={{ color: entry.color }}>
              {entry.dataKey === 'revenue' ? 'Receita' : 'Lucro'}: {formatCurrency(entry.value)}
            </p>
          ))}
        </div>
      );
    }
    return null;
  };

  const renderLegend = (props) => {
    const { payload } = props;
    return (
      <ul className="pie-legend" style={{ marginTop: '0.5rem' }}>
        {payload.map((entry, index) => (
          <li key={`item-${index}`} className="pie-legend-item">
            <span 
              className="pie-legend-color" 
              style={{ backgroundColor: entry.color }}
            />
            <span className="pie-legend-text">
              {entry.dataKey === 'revenue' ? 'Receita' : 'Lucro'}
            </span>
          </li>
        ))}
      </ul>
    );
  };

  return (
    <ResponsiveContainer width="100%" height={280}>
      <AreaChart data={data} margin={{ top: 10, right: 30, left: 0, bottom: 0 }}>
        <defs>
          <linearGradient id="colorRevenue" x1="0" y1="0" x2="0" y2="1">
            <stop offset="5%" stopColor="#00d4ff" stopOpacity={0.4} />
            <stop offset="95%" stopColor="#00d4ff" stopOpacity={0} />
          </linearGradient>
          <linearGradient id="colorProfit" x1="0" y1="0" x2="0" y2="1">
            <stop offset="5%" stopColor="#10b981" stopOpacity={0.4} />
            <stop offset="95%" stopColor="#10b981" stopOpacity={0} />
          </linearGradient>
        </defs>
        <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" />
        <XAxis
          dataKey="month"
          stroke="#64748b"
          fontSize={11}
          tickLine={false}
          axisLine={false}
        />
        <YAxis
          stroke="#64748b"
          fontSize={11}
          tickLine={false}
          axisLine={false}
          tickFormatter={formatCurrency}
        />
        <Tooltip content={<CustomTooltip />} />
        <Legend content={renderLegend} />
        <Area
          type="monotone"
          dataKey="revenue"
          stroke="#00d4ff"
          strokeWidth={2}
          fillOpacity={1}
          fill="url(#colorRevenue)"
        />
        <Area
          type="monotone"
          dataKey="profit"
          stroke="#10b981"
          strokeWidth={2}
          fillOpacity={1}
          fill="url(#colorProfit)"
        />
      </AreaChart>
    </ResponsiveContainer>
  );
};

export default RevenueChart;
