import React from 'react';
import { useCubeQuery } from '@cubejs-client/react';
import {
  PieChart,
  Pie,
  Cell,
  ResponsiveContainer,
  Legend,
  Tooltip,
} from 'recharts';
import './Charts.css';

const COLORS = ['#10b981', '#00d4ff', '#a855f7', '#f59e0b'];

const ShipModeChart = ({ filters }) => {
  const buildQuery = () => {
    const query = {
      measures: ['Orders.count'],
      dimensions: ['Orders.shipMode'],
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

  const shipModeLabels = {
    'Standard Class': 'Padrão',
    'Second Class': 'Econômico',
    'First Class': 'Prioritário',
    'Same Day': 'No Dia',
  };

  const data = resultSet?.tablePivot().map((row) => ({
    name: shipModeLabels[row['Orders.shipMode']] || row['Orders.shipMode'],
    value: parseInt(row['Orders.count']),
  })) || [];

  const CustomTooltip = ({ active, payload }) => {
    if (active && payload && payload.length) {
      return (
        <div className="custom-tooltip">
          <p className="tooltip-label">{payload[0].name}</p>
          <p className="tooltip-value" style={{ color: payload[0].payload.fill }}>
            {payload[0].value} pedidos
          </p>
        </div>
      );
    }
    return null;
  };

  const renderLegend = (props) => {
    const { payload } = props;
    return (
      <ul className="pie-legend">
        {payload.map((entry, index) => (
          <li key={`item-${index}`} className="pie-legend-item">
            <span 
              className="pie-legend-color" 
              style={{ backgroundColor: entry.color }}
            />
            <span className="pie-legend-text">{entry.value}</span>
          </li>
        ))}
      </ul>
    );
  };

  return (
    <ResponsiveContainer width="100%" height={250}>
      <PieChart>
        <Pie
          data={data}
          cx="50%"
          cy="45%"
          innerRadius={45}
          outerRadius={75}
          paddingAngle={3}
          dataKey="value"
          stroke="none"
        >
          {data.map((entry, index) => (
            <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
          ))}
        </Pie>
        <Tooltip content={<CustomTooltip />} />
        <Legend content={renderLegend} verticalAlign="bottom" height={36} />
      </PieChart>
    </ResponsiveContainer>
  );
};

export default ShipModeChart;


