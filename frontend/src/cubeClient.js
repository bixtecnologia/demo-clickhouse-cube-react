import cubejs from '@cubejs-client/core';

const CUBE_API_URL = import.meta.env.VITE_CUBEJS_API_URL || 'http://localhost:4000/cubejs-api/v1';
const CUBE_TOKEN = import.meta.env.VITE_CUBEJS_TOKEN || 'cubejs_secret_key_change_me';

export const cubeApi = cubejs(CUBE_TOKEN, {
  apiUrl: CUBE_API_URL,
});



