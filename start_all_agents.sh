#!/bin/bash

# A2A Multi-Agent Startup Script
# This script starts all your A2A agents in the background

echo "🚀 Starting A2A Multi-Agent System..."
echo "=================================="

# Create logs directory if it doesn't exist
mkdir -p logs

# Function to start an agent
start_agent() {
    local name=$1
    local path=$2
    local port=$3
    local base_dir=$(pwd)
    
    echo "Starting $name on port $port..."
    (
        cd "$path"
        nohup uv run . > "${base_dir}/logs/${name}.log" 2>&1 &
        echo $! > "${base_dir}/logs/${name}.pid"
    )
    sleep 2  # Give it a moment to start
    if [ -f "logs/${name}.pid" ]; then
        echo "✅ $name started (PID: $(cat logs/${name}.pid))"
    else
        echo "❌ $name failed to start - check logs/${name}.log"
    fi
}

# Start Demo UI
echo "Starting Demo UI on port 12000..."
base_dir=$(pwd)
(
    cd demo/ui
    nohup uv run main.py > "${base_dir}/logs/demo-ui.log" 2>&1 &
    echo $! > "${base_dir}/logs/demo-ui.pid"
)
sleep 2
echo "✅ Demo UI started (PID: $(cat logs/demo-ui.pid))"

# Start all agents
start_agent "currency-agent" "samples/python/agents/langgraph" "10000"
start_agent "image-agent" "samples/python/agents/crewai" "10001"
start_agent "expense-agent" "samples/python/agents/google_adk" "10002"
start_agent "youtube-agent" "samples/python/agents/ag2" "10010"
start_agent "travel-agent" "samples/python/agents/semantickernel" "10020"
start_agent "contact-agent" "samples/python/agents/marvin" "10030"
start_agent "data-agent" "samples/python/agents/mindsdb" "10006"

echo ""
echo "🎉 All agents started successfully!"
echo "=================================="
echo "Demo UI:        http://localhost:12000"
echo "Currency Agent: http://localhost:10000"
echo "Image Agent:    http://localhost:10001"
echo "Expense Agent:  http://localhost:10002"
echo "YouTube Agent:  http://localhost:10010"
echo "Travel Agent:   http://localhost:10020"
echo "Contact Agent:  http://localhost:10030"
echo "Data Agent:     http://localhost:10006"
echo ""
echo "📋 To add agents to the UI:"
echo "   1. Go to http://localhost:12000"
echo "   2. Click 'Agents' tab"
echo "   3. Add: localhost:10000, localhost:10001, localhost:10002, localhost:10010, localhost:10020, localhost:10030, localhost:10006"
echo ""
echo "📝 Logs are in the 'logs/' directory"
echo "🛑 To stop all agents, run: ./stop_all_agents.sh"
echo ""
echo "⏳ Waiting 10 seconds for all services to fully start..."
sleep 10
echo "�� Ready for demo!" 