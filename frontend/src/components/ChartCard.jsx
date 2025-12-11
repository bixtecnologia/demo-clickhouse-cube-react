import React from 'react';
import { motion } from 'framer-motion';
import './ChartCard.css';

const ChartCard = ({ title, subtitle, children, size = 'default' }) => {
  return (
    <motion.div 
      className={`chart-card chart-card--${size}`}
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.5, delay: 0.1 }}
    >
      <div className="chart-card__header">
        <div className="chart-card__titles">
          <h3 className="chart-card__title">{title}</h3>
          {subtitle && <span className="chart-card__subtitle">{subtitle}</span>}
        </div>
        <div className="chart-card__actions">
          <button className="chart-card__btn">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
              <circle cx="12" cy="12" r="1"/>
              <circle cx="19" cy="12" r="1"/>
              <circle cx="5" cy="12" r="1"/>
            </svg>
          </button>
        </div>
      </div>
      <div className="chart-card__body">
        {children}
      </div>
    </motion.div>
  );
};

export default ChartCard;



