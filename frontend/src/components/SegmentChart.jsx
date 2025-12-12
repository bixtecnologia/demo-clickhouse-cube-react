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

const COLORS = ['#00d4ff', '#a855f7', '#f59e0b'];

const SegmentChart = ({ filters }) => {
  const buildQuery = () => {
    const dateFilter = getDateFilter(filters?.dateRange || 'all');
    
    const query = {
      measures: ['Orders.totalRevenue'],
      dimensions: ['Customers.segment'],
      order: {
        'Orders.totalRevenue': 'desc',
      },
      timeDimensions: [{
        dimension: 'Orders.orderDate',
        dateRange: dateFilter,
      }],
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

  const segmentLabels = {
    'Consumer': 'Consumidor',
    'Corporate': 'Corporativo',
    'Home Office': 'Home Office',
  };

  const data = resultSet?.tablePivot().map((row) => ({
    segment: segmentLabels[row['Customers.segment']] || row['Customers.segment'],
    revenue: parseFloat(row['Orders.totalRevenue']) || 0,
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
      <BarChart data={data} layout="vertical" margin={{ top: 5, right: 30, left: 20, bottom: 5 }}>
        <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" horizontal={false} />
        <XAxis
          type="number"
          stroke="#64748b"
          fontSize={12}
          tickLine={false}
          axisLine={false}
          tickFormatter={formatCurrency}
        />
        <YAxis
          type="category"
          dataKey="segment"
          stroke="#64748b"
          fontSize={12}
          tickLine={false}
          axisLine={false}
          width={90}
        />
        <Tooltip content={<CustomTooltip />} cursor={{ fill: 'rgba(255,255,255,0.03)' }} />
        <Bar dataKey="revenue" radius={[0, 4, 4, 0]} barSize={24}>
          {data.map((entry, index) => (
            <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
          ))}
        </Bar>
      </BarChart>
    </ResponsiveContainer>
  );
};

export default SegmentChart;
