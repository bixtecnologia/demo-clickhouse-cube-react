import React from 'react';
import { useCubeQuery } from '@cubejs-client/react';
import { motion } from 'framer-motion';
import './OrdersTable.css';

const OrdersTable = ({ filters }) => {
  // Build the query based on filters
  const buildQuery = () => {
    const query = {
      measures: ['Orders.totalRevenue', 'Orders.totalProfit'],
      dimensions: [
        'Orders.orderId',
        'Orders.orderDate',
        'Orders.status',
        'Orders.shipMode',
        'Customers.customerName',
        'Customers.segment',
      ],
      order: {
        'Orders.orderDate': 'desc',
      },
      limit: 15,
    };

    const queryFilters = [];

    if (filters?.status && filters.status !== 'all') {
      queryFilters.push({
        dimension: 'Orders.status',
        operator: 'equals',
        values: [filters.status],
      });
    }

    if (filters?.segment && filters.segment !== 'all') {
      queryFilters.push({
        dimension: 'Customers.segment',
        operator: 'equals',
        values: [filters.segment],
      });
    }

    if (filters?.dateRange && filters.dateRange !== 'all') {
      const dateFilter = getDateFilter(filters.dateRange);
      if (dateFilter) {
        query.timeDimensions = [{
          dimension: 'Orders.orderDate',
          dateRange: dateFilter,
        }];
      }
    }

    if (queryFilters.length > 0) {
      query.filters = queryFilters;
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

  const statusColors = {
    'Pending': 'status--pending',
    'Processing': 'status--processing',
    'Shipped': 'status--shipped',
    'Delivered': 'status--delivered',
    'Cancelled': 'status--cancelled',
  };

  const statusLabels = {
    'Pending': 'Pendente',
    'Processing': 'Processando',
    'Shipped': 'Enviado',
    'Delivered': 'Entregue',
    'Cancelled': 'Cancelado',
  };

  const segmentLabels = {
    'Consumer': 'Consumidor',
    'Corporate': 'Corporativo',
    'Home Office': 'Home Office',
  };

  const shipModeLabels = {
    'Standard Class': 'Padrão',
    'Second Class': 'Econômico',
    'First Class': 'Prioritário',
    'Same Day': 'No Dia',
  };

  const formatCurrency = (value) => {
    return new Intl.NumberFormat('pt-BR', {
      style: 'currency',
      currency: 'BRL',
    }).format(value);
  };

  const formatDate = (dateStr) => {
    if (!dateStr) return '-';
    return new Date(dateStr).toLocaleDateString('pt-BR', {
      day: '2-digit',
      month: 'short',
      year: 'numeric',
    });
  };

  if (isLoading) {
    return (
      <div className="orders-table-loading">
        <div className="table-skeleton">
          {[...Array(5)].map((_, i) => (
            <div key={i} className="skeleton-row" style={{ animationDelay: `${i * 0.1}s` }} />
          ))}
        </div>
      </div>
    );
  }

  if (error) {
    return <div className="orders-table-error">Erro ao carregar dados</div>;
  }

  const data = resultSet?.tablePivot() || [];

  return (
    <div className="orders-table-wrapper">
      <table className="orders-table">
        <thead>
          <tr>
            <th>Pedido</th>
            <th>Cliente</th>
            <th>Segmento</th>
            <th>Data</th>
            <th>Envio</th>
            <th>Status</th>
            <th className="text-right">Receita</th>
            <th className="text-right">Lucro</th>
          </tr>
        </thead>
        <tbody>
          {data.map((row, index) => (
            <motion.tr
              key={row['Orders.orderId']}
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: index * 0.03 }}
            >
              <td className="order-id">#{row['Orders.orderId']}</td>
              <td className="customer-name">{row['Customers.customerName']}</td>
              <td>
                <span className="segment-badge">
                  {segmentLabels[row['Customers.segment']] || row['Customers.segment']}
                </span>
              </td>
              <td className="order-date">{formatDate(row['Orders.orderDate'])}</td>
              <td className="ship-mode">{shipModeLabels[row['Orders.shipMode']] || row['Orders.shipMode']}</td>
              <td>
                <span className={`status-badge ${statusColors[row['Orders.status']] || ''}`}>
                  {statusLabels[row['Orders.status']] || row['Orders.status']}
                </span>
              </td>
              <td className="text-right revenue">{formatCurrency(row['Orders.totalRevenue'])}</td>
              <td className="text-right profit">{formatCurrency(row['Orders.totalProfit'])}</td>
            </motion.tr>
          ))}
        </tbody>
      </table>
      {data.length === 0 && (
        <div className="orders-table-empty">
          Nenhum pedido encontrado com os filtros selecionados
        </div>
      )}
    </div>
  );
};

export default OrdersTable;


