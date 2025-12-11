import React from 'react';
import { motion } from 'framer-motion';
import './KPICard.css';

const KPICard = ({ title, value, icon, color, loading, trend, trendUp }) => {
  return (
    <motion.div 
      className={`kpi-card kpi-card--${color}`}
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.4 }}
      whileHover={{ y: -4 }}
    >
      <div className="kpi-card__header">
        <span className="kpi-card__icon">{icon}</span>
        <div className={`kpi-card__trend ${trendUp ? 'trend-up' : 'trend-down'}`}>
          <span className="trend-arrow">{trendUp ? '↑' : '↓'}</span>
          <span className="trend-value">{trend}</span>
        </div>
      </div>
      
      <div className="kpi-card__body">
        {loading ? (
          <div className="kpi-card__skeleton" />
        ) : (
          <motion.span 
            className="kpi-card__value"
            initial={{ scale: 0.8 }}
            animate={{ scale: 1 }}
            transition={{ delay: 0.2, type: 'spring' }}
          >
            {value}
          </motion.span>
        )}
        <span className="kpi-card__title">{title}</span>
      </div>
      
      <div className="kpi-card__glow" />
    </motion.div>
  );
};

export default KPICard;



