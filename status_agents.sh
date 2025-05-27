#!/bin/bash

# A2A Multi-Agent Status Script
# This script shows the status of all your A2A agents

echo "📊 A2A Multi-Agent System Status"
echo "================================="

# Function to check agent status
check_agent() {
    local name=$1
    local port=$2
    local pidfile="logs/${name}.pid"
    
    if [ -f "$pidfile" ]; then
        local pid=$(cat "$pidfile")
        if kill -0 "$pid" 2>/dev/null; then
            # Check if port is actually responding
            if curl -s "http://localhost:$port" >/dev/null 2>&1; then
                echo "✅ $name (PID: $pid, Port: $port) - RUNNING"
            else
                echo "⚠️  $name (PID: $pid, Port: $port) - PROCESS RUNNING BUT NOT RESPONDING"
            fi
        else
            echo "❌ $name - STOPPED (stale PID file)"
            rm "$pidfile" 2>/dev/null
        fi
    else
        echo "❌ $name - STOPPED"
    fi
}

# Check all agents
check_agent "demo-ui" "12000"
check_agent "currency-agent" "10000"
check_agent "image-agent" "10001"
check_agent "expense-agent" "10002"
check_agent "youtube-agent" "10010"
check_agent "travel-agent" "10020"
check_agent "contact-agent" "10030"

echo ""
echo "🌐 Quick Access URLs:"
echo "Demo UI:        http://localhost:12000"
echo "Currency Agent: http://localhost:10000"
echo "Image Agent:    http://localhost:10001"
echo "Expense Agent:  http://localhost:10002"
echo "YouTube Agent:  http://localhost:10010"
echo "Travel Agent:   http://localhost:10020"
echo "Contact Agent:  http://localhost:10030" 