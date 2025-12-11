import React from 'react';
import ReactDOM from 'react-dom/client';
import { CubeProvider } from '@cubejs-client/react';
import { cubeApi } from './cubeClient';
import './index.css';
import App from './App';

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <CubeProvider cubeApi={cubeApi}>
      <App />
    </CubeProvider>
  </React.StrictMode>
);

