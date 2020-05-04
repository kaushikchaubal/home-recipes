package metrics

import (
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promauto"
)

var HttpRequestMetric = promauto.NewHistogramVec(
	prometheus.HistogramOpts{
		Name:    "home_recipes_http_request",
		Buckets: prometheus.LinearBuckets(20, 5, 5),
	},
	[]string{"status", "method", "endpoint"},
)

var GRPCRequestMetric = promauto.NewHistogramVec(
	prometheus.HistogramOpts{
		Name:    "home_recipes_grpc_request",
		Buckets: prometheus.LinearBuckets(20, 5, 5),
	},
	[]string{"status", "endpoint"},
)
