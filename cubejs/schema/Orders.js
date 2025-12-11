cube(`Orders`, {
  sql: `SELECT * FROM analytics.orders`,

  preAggregations: {
    // Pre-aggregation with time dimension index for ClickHouse
    ordersRollup: {
      measures: [Orders.count, Orders.totalRevenue, Orders.totalProfit, Orders.averageOrderValue],
      dimensions: [Orders.status, Orders.shipMode],
      timeDimension: Orders.orderDate,
      granularity: `day`,
      indexes: {
        categoryIndex: {
          columns: [Orders.status],
        },
      },
    },
  },

  joins: {
    Customers: {
      sql: `${CUBE}.customer_id = ${Customers}.customer_id`,
      relationship: `belongsTo`,
    },
  },

  measures: {
    count: {
      type: `count`,
      drillMembers: [orderId, orderDate],
    },

    totalRevenue: {
      sql: `total_amount`,
      type: `sum`,
      format: `currency`,
    },

    totalProfit: {
      sql: `profit`,
      type: `sum`,
      format: `currency`,
    },

    averageOrderValue: {
      sql: `total_amount`,
      type: `avg`,
      format: `currency`,
    },

    averageDiscount: {
      sql: `discount`,
      type: `avg`,
      format: `percent`,
    },

    profitMargin: {
      sql: `${totalProfit} / NULLIF(${totalRevenue}, 0) * 100`,
      type: `number`,
      format: `percent`,
    },
  },

  dimensions: {
    orderId: {
      sql: `order_id`,
      type: `number`,
      primaryKey: true,
    },

    customerId: {
      sql: `customer_id`,
      type: `number`,
    },

    orderDate: {
      sql: `order_date`,
      type: `time`,
    },

    shipDate: {
      sql: `ship_date`,
      type: `time`,
    },

    shipMode: {
      sql: `ship_mode`,
      type: `string`,
    },

    status: {
      sql: `status`,
      type: `string`,
    },

    totalAmount: {
      sql: `total_amount`,
      type: `number`,
      format: `currency`,
    },

    discount: {
      sql: `discount`,
      type: `number`,
      format: `percent`,
    },

    profit: {
      sql: `profit`,
      type: `number`,
      format: `currency`,
    },
  },

  dataSource: `default`,
});


