import React from 'react';
import { motion } from 'framer-motion';
import './Filters.css';

const Filters = ({ filters, onFilterChange }) => {
  const handleChange = (field, value) => {
    onFilterChange({ ...filters, [field]: value });
  };

  return (
    <motion.div 
      className="filters"
      initial={{ opacity: 0, y: -10 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.3 }}
    >
      <div className="filters__group">
        <label className="filters__label">Período</label>
        <select 
          className="filters__select"
          value={filters.dateRange}
          onChange={(e) => handleChange('dateRange', e.target.value)}
        >
          <option value="all">Todo o Período</option>
          <option value="last30">Últimos 30 dias</option>
          <option value="last90">Últimos 90 dias</option>
          <option value="last180">Últimos 6 meses</option>
          <option value="2025-Q1">1º Trimestre 2025</option>
          <option value="2025-Q2">2º Trimestre 2025</option>
          <option value="2025-Q3">3º Trimestre 2025</option>
          <option value="2025-Q4">4º Trimestre 2025</option>
        </select>
      </div>

      <div className="filters__group">
        <label className="filters__label">Segmento</label>
        <select 
          className="filters__select"
          value={filters.segment}
          onChange={(e) => handleChange('segment', e.target.value)}
        >
          <option value="all">Todos</option>
          <option value="Consumer">Consumidor</option>
          <option value="Corporate">Corporativo</option>
          <option value="Home Office">Home Office</option>
        </select>
      </div>

      <div className="filters__group">
        <label className="filters__label">Status</label>
        <select 
          className="filters__select"
          value={filters.status}
          onChange={(e) => handleChange('status', e.target.value)}
        >
          <option value="all">Todos</option>
          <option value="Pending">Pendente</option>
          <option value="Processing">Processando</option>
          <option value="Shipped">Enviado</option>
          <option value="Delivered">Entregue</option>
        </select>
      </div>

      <button 
        className="filters__reset"
        onClick={() => onFilterChange({ dateRange: 'last30', segment: 'all', status: 'all' })}
      >
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
          <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"/>
          <path d="M3 3v5h5"/>
        </svg>
        Limpar
      </button>
    </motion.div>
  );
};

export default Filters;


