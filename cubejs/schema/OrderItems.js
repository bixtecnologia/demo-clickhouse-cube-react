cube(`OrderItems`, {
  sql: `SELECT * FROM analytics.order_items`,

  // Pre-aggregations removed - ClickHouse requires time dimension indexes
  // Query performance is still good due to ClickHouse's native columnar storage

  joins: {
    Orders: {
      sql: `${CUBE}.order_id = ${Orders}.order_id`,
      relationship: `belongsTo`,
    },
    Products: {
      sql: `${CUBE}.product_id = ${Products}.product_id`,
      relationship: `belongsTo`,
    },
  },

  measures: {
    count: {
      type: `count`,
      drillMembers: [itemId, orderId, productId],
    },

    totalQuantity: {
      sql: `quantity`,
      type: `sum`,
    },

    totalSales: {
      sql: `total`,
      type: `sum`,
      format: `currency`,
    },

    averageQuantity: {
      sql: `quantity`,
      type: `avg`,
    },

    averageItemValue: {
      sql: `total`,
      type: `avg`,
      format: `currency`,
    },
  },

  dimensions: {
    itemId: {
      sql: `item_id`,
      type: `number`,
      primaryKey: true,
    },

    orderId: {
      sql: `order_id`,
      type: `number`,
    },

    productId: {
      sql: `product_id`,
      type: `number`,
    },

    quantity: {
      sql: `quantity`,
      type: `number`,
    },

    unitPrice: {
      sql: `unit_price`,
      type: `number`,
      format: `currency`,
    },

    discount: {
      sql: `discount`,
      type: `number`,
      format: `percent`,
    },

    total: {
      sql: `total`,
      type: `number`,
      format: `currency`,
    },
  },

  dataSource: `default`,
});


