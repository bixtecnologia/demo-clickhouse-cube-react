cube(`Products`, {
  sql: `SELECT * FROM analytics.products`,

  // Pre-aggregations removed - ClickHouse requires time dimension indexes
  // Query performance is still good due to ClickHouse's native columnar storage

  joins: {
    OrderItems: {
      sql: `${CUBE}.product_id = ${OrderItems}.product_id`,
      relationship: `hasMany`,
    },
  },

  measures: {
    count: {
      type: `count`,
      drillMembers: [productId, productName, category],
    },

    averagePrice: {
      sql: `unit_price`,
      type: `avg`,
      format: `currency`,
    },

    totalValue: {
      sql: `unit_price`,
      type: `sum`,
      format: `currency`,
    },
  },

  dimensions: {
    productId: {
      sql: `product_id`,
      type: `number`,
      primaryKey: true,
    },

    productName: {
      sql: `product_name`,
      type: `string`,
    },

    category: {
      sql: `category`,
      type: `string`,
    },

    subCategory: {
      sql: `sub_category`,
      type: `string`,
    },

    brand: {
      sql: `brand`,
      type: `string`,
    },

    unitPrice: {
      sql: `unit_price`,
      type: `number`,
      format: `currency`,
    },

    costPrice: {
      sql: `cost_price`,
      type: `number`,
      format: `currency`,
    },

    createdAt: {
      sql: `created_at`,
      type: `time`,
    },
  },

  dataSource: `default`,
});


