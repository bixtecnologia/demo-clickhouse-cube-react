cube(`DailyMetrics`, {
  sql: `SELECT * FROM analytics.daily_metrics`,

  preAggregations: {
    metricsRollup: {
      measures: [
        DailyMetrics.totalOrders,
        DailyMetrics.totalRevenue,
        DailyMetrics.totalProfit,
        DailyMetrics.avgOrderValue,
      ],
      timeDimension: DailyMetrics.date,
      granularity: `day`,
      indexes: {
        timeIndex: {
          columns: [DailyMetrics.date],
        },
      },
    },
  },

  measures: {
    totalOrders: {
      sql: `total_orders`,
      type: `sum`,
    },

    totalRevenue: {
      sql: `total_revenue`,
      type: `sum`,
      format: `currency`,
    },

    totalProfit: {
      sql: `total_profit`,
      type: `sum`,
      format: `currency`,
    },

    newCustomers: {
      sql: `new_customers`,
      type: `sum`,
    },

    avgOrderValue: {
      sql: `avg_order_value`,
      type: `avg`,
      format: `currency`,
    },
  },

  dimensions: {
    date: {
      sql: `date`,
      type: `time`,
    },
  },

  dataSource: `default`,
});


