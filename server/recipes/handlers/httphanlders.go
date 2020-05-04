package handlers

import (
	"home-recipes/server/recipes/metrics"
	"math/rand"
	"net/http"
	"strconv"
	"time"
)

type HttpHandler struct {
}

func (handler *HttpHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	start := time.Now()
	status := 200

	rand.Seed(time.Now().UnixNano())
	sleepTime := rand.Intn(2000) // sleepTime will be between 0 and 10
	time.Sleep(time.Duration(sleepTime) * time.Millisecond)

	_, _ = w.Write([]byte("I've slept " + strconv.Itoa(sleepTime) + " milliseconds"))

	if sleepTime%2 == 1 {
		status = 500
	}

	metrics.HttpRequestMetric.WithLabelValues(strconv.Itoa(status), "http", r.URL.Path).Observe(float64(time.Since(start).Milliseconds()))
}
