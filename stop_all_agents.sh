#!/bin/bash

# A2A Multi-Agent Shutdown Script
# This script stops all your A2A agents cleanly

echo "🛑 Stopping A2A Multi-Agent System..."
echo "====================================="

# Function to stop an agent
stop_agent() {
    local name=$1
    local pidfile="logs/${name}.pid"
    
    if [ -f "$pidfile" ]; then
        local pid=$(cat "$pidfile")
        if kill -0 "$pid" 2>/dev/null; then
            echo "Stopping $name (PID: $pid)..."
            kill "$pid"
            rm "$pidfile"
            echo "✅ $name stopped"
        else
            echo "⚠️  $name was not running"
            rm "$pidfile" 2>/dev/null
        fi
    else
        echo "⚠️  No PID file found for $name"
    fi
}

# Stop all agents
stop_agent "demo-ui"
stop_agent "currency-agent"
stop_agent "image-agent"
stop_agent "expense-agent"
stop_agent "youtube-agent"
stop_agent "travel-agent"
stop_agent "contact-agent"
stop_agent "data-agent"

# Also kill any remaining uv processes (backup cleanup)
echo ""
echo "🧹 Cleaning up any remaining processes..."
pkill -f "uv run" 2>/dev/null || true

echo ""
echo "✅ All agents stopped successfully!"
echo "📝 Logs are preserved in the 'logs/' directory"
echo "🚀 To start again, run: ./start_all_agents.sh" 