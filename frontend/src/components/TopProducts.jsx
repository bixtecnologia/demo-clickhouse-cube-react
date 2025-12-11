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

const TopProducts = () => {
  const { resultSet, isLoading, error } = useCubeQuery({
    measures: ['Products.count'],
    dimensions: ['Products.category'],
    order: {
      'Products.count': 'desc',
    },
    limit: 5,
  });

  if (isLoading) {
    return <div className="chart-loading">Carregando...</div>;
  }

  if (error) {
    return <div className="chart-error">Erro ao carregar dados</div>;
  }

  const data = resultSet?.tablePivot().map((row) => ({
    category: row['Products.category'],
    count: parseInt(row['Products.count']),
  })) || [];

  const CustomTooltip = ({ active, payload, label }) => {
    if (active && payload && payload.length) {
      return (
        <div className="custom-tooltip">
          <p className="tooltip-label">{label}</p>
          <p className="tooltip-value" style={{ color: payload[0].payload.fill }}>
            {payload[0].value} produtos
          </p>
        </div>
      );
    }
    return null;
  };

  // Calculate max value for percentage bars
  const maxCount = Math.max(...data.map(d => d.count), 1);

  return (
    <div className="top-products">
      <div className="top-products-chart">
        <ResponsiveContainer width="100%" height={200}>
          <BarChart data={data} margin={{ top: 5, right: 30, left: 20, bottom: 5 }}>
            <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" />
            <XAxis
              dataKey="category"
              stroke="#64748b"
              fontSize={11}
              tickLine={false}
              axisLine={false}
              interval={0}
              angle={-15}
              textAnchor="end"
              height={60}
            />
            <YAxis
              stroke="#64748b"
              fontSize={12}
              tickLine={false}
              axisLine={false}
            />
            <Tooltip content={<CustomTooltip />} cursor={{ fill: 'rgba(255,255,255,0.03)' }} />
            <Bar dataKey="count" radius={[4, 4, 0, 0]} barSize={40}>
              {data.map((entry, index) => (
                <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
              ))}
            </Bar>
          </BarChart>
        </ResponsiveContainer>
      </div>
      
      <div className="top-products-list">
        {data.map((item, index) => (
          <div key={index} className="product-item">
            <div className="product-info">
              <span 
                className="product-color" 
                style={{ backgroundColor: COLORS[index % COLORS.length] }}
              />
              <span className="product-name">{item.category}</span>
            </div>
            <div className="product-stats">
              <div className="product-bar-container">
                <div 
                  className="product-bar" 
                  style={{ 
                    width: `${(item.count / maxCount) * 100}%`,
                    backgroundColor: COLORS[index % COLORS.length]
                  }}
                />
              </div>
              <span className="product-count">{item.count}</span>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default TopProducts;



