#!/bin/bash
aca-py start --arg-file /configs/config.yml&
PID=$!
echo "ACA-Py started with PID: $PID"
wait $PID
