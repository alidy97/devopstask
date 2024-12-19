#!/usr/bin/env python3
# -*- encoding: utf-8 -*-

"""
Implements a trivial metrics exporter for Prometheus.
"""

import argparse
import random
import time

from prometheus_client import start_http_server, Counter, Gauge

# Define metrics
REQUEST_COUNT = Counter("example_requests_total", "Total number of requests")
RANDOM_GAUGE = Gauge("example_random_number", "A random number")


def parse_args() -> dict:
    """
    Parse command line arguments

    :return: parsed arguments as a dictionary
    """
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-p", "--port", help="serve /metrics on this port", type=int, default=8000
    )
    args = vars(parser.parse_args())

    return args


def process_request():
    """
    Simulate processing a request and updating metrics.
    """
    REQUEST_COUNT.inc()  # Increment the counter by 1
    RANDOM_GAUGE.set(random.random() * 10)  # Set the gauge to a random value


def main():
    args = parse_args()

    print(f"Starting Prometheus exporter on port {args["port"]}...")
    start_http_server(args["port"])

    # Simulate application logic
    while True:
        process_request()
        time.sleep(5)


if __name__ == '__main__':
    main()
