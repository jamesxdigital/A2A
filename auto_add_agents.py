#!/usr/bin/env python3
"""
Auto-add agents to A2A Demo UI
This script automatically registers all agents with the demo UI after startup.
"""

import asyncio
import time
import httpx
import json

# List of all your agents
AGENTS = [
    "localhost:10000",  # Currency Agent (LangGraph)
    "localhost:10001",  # Image Agent (CrewAI)
    "localhost:10002",  # Expense Agent (Google ADK)
    "localhost:10010",  # YouTube Agent (AG2)
    "localhost:10020",  # Travel Agent (Semantic Kernel)
    "localhost:10030",  # Contact Agent (Marvin)
    "localhost:10006",  # Data Agent (MindsDB)
]

DEMO_UI_URL = "http://localhost:12000"

async def wait_for_demo_ui():
    """Wait for the demo UI to be ready"""
    print("⏳ Waiting for Demo UI to be ready...")
    
    for attempt in range(30):  # Wait up to 30 seconds
        try:
            async with httpx.AsyncClient() as client:
                response = await client.get(DEMO_UI_URL, timeout=2.0)
                if response.status_code == 200:
                    print("✅ Demo UI is ready!")
                    return True
        except:
            pass
        
        print(f"   Attempt {attempt + 1}/30...")
        await asyncio.sleep(1)
    
    print("❌ Demo UI failed to start")
    return False

async def wait_for_agent(agent_url):
    """Wait for a specific agent to be ready"""
    for attempt in range(10):  # Wait up to 10 seconds per agent
        try:
            async with httpx.AsyncClient() as client:
                # Try to get agent card
                response = await client.post(
                    f"http://{agent_url}",
                    json={
                        "jsonrpc": "2.0",
                        "method": "agent/card",
                        "id": 1
                    },
                    timeout=2.0
                )
                if response.status_code == 200:
                    return True
        except:
            pass
        await asyncio.sleep(1)
    return False

async def register_agent(agent_url):
    """Register an agent with the demo UI"""
    try:
        async with httpx.AsyncClient() as client:
            response = await client.post(
                f"{DEMO_UI_URL}/agent/register",
                json={
                    "jsonrpc": "2.0",
                    "method": "agent/register",
                    "params": agent_url,
                    "id": 1
                },
                timeout=5.0
            )
            
            if response.status_code == 200:
                print(f"✅ Registered agent: {agent_url}")
                return True
            else:
                print(f"❌ Failed to register {agent_url}: HTTP {response.status_code}")
                return False
                
    except Exception as e:
        print(f"❌ Failed to register {agent_url}: {e}")
        return False

async def main():
    """Main function to auto-add all agents"""
    print("🚀 Auto-adding agents to A2A Demo UI...")
    print("=" * 50)
    
    # Wait for demo UI to be ready
    if not await wait_for_demo_ui():
        return
    
    # Wait a bit more for full initialization
    await asyncio.sleep(3)
    
    print("\n🔍 Checking agent availability...")
    available_agents = []
    
    for agent_url in AGENTS:
        print(f"   Checking {agent_url}...")
        if await wait_for_agent(agent_url):
            available_agents.append(agent_url)
            print(f"   ✅ {agent_url} is ready")
        else:
            print(f"   ❌ {agent_url} is not responding")
    
    if not available_agents:
        print("\n❌ No agents are available to register")
        return
    
    print(f"\n📝 Registering {len(available_agents)} available agents...")
    
    success_count = 0
    for agent_url in available_agents:
        if await register_agent(agent_url):
            success_count += 1
        await asyncio.sleep(0.5)  # Small delay between registrations
    
    print("\n" + "=" * 50)
    print(f"🎉 Successfully registered {success_count}/{len(available_agents)} agents!")
    print("🌐 Go to http://localhost:12000 and click 'Agents' tab to see them")
    print("💬 You can now start chatting with your multi-agent system!")

if __name__ == "__main__":
    asyncio.run(main()) 