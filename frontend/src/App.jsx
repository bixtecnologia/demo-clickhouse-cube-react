import React from 'react';
import Dashboard from './components/Dashboard';
import './App.css';

function App() {
  return (
    <div className="app">
      <header className="app-header">
        <div className="header-content">
          <div className="logo-section">
            <div className="logo-icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <path d="M12 2L2 7l10 5 10-5-10-5z"/>
                <path d="M2 17l10 5 10-5"/>
                <path d="M2 12l10 5 10-5"/>
              </svg>
            </div>
            <div className="logo-text">
              <h1>Analytics</h1>
              <span className="logo-subtitle">Dashboard</span>
            </div>
          </div>
          <div className="header-info">
            <div className="status-badge">
              <span className="status-dot"></span>
              <span>Live Data</span>
            </div>
            <div className="tech-stack">
              <span className="tech-tag">ClickHouse</span>
              <span className="tech-tag">Cube.js</span>
              <span className="tech-tag">React</span>
            </div>
          </div>
        </div>
      </header>
      <main className="app-main">
        <Dashboard />
      </main>
    </div>
  );
}

export default App;

