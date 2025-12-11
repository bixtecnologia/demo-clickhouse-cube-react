cube(`Customers`, {
  sql: `SELECT * FROM analytics.customers`,

  // Pre-aggregations removed - ClickHouse requires time dimension indexes
  // Query performance is still good due to ClickHouse's native columnar storage

  joins: {
    Orders: {
      sql: `${CUBE}.customer_id = ${Orders}.customer_id`,
      relationship: `hasMany`,
    },
  },

  measures: {
    count: {
      type: `count`,
      drillMembers: [customerId, customerName, city],
    },

    uniqueCustomersWithOrders: {
      sql: `customer_id`,
      type: `countDistinct`,
    },
  },

  dimensions: {
    customerId: {
      sql: `customer_id`,
      type: `number`,
      primaryKey: true,
    },

    customerName: {
      sql: `customer_name`,
      type: `string`,
    },

    email: {
      sql: `email`,
      type: `string`,
    },

    phone: {
      sql: `phone`,
      type: `string`,
    },

    city: {
      sql: `city`,
      type: `string`,
    },

    state: {
      sql: `state`,
      type: `string`,
    },

    country: {
      sql: `country`,
      type: `string`,
    },

    segment: {
      sql: `segment`,
      type: `string`,
    },

    createdAt: {
      sql: `created_at`,
      type: `time`,
    },
  },

  dataSource: `default`,
});


