# Scenario 1: Executive Expense Management
*Multi-Agent Collaboration Demo*

---

## Scenario Overview

**Business Context**: An executive returns from a business trip to London with multiple expenses that need processing, currency conversion, and integration with company systems.

**Agents Involved**: Currency Agent, Expense Agent, Data Agent, Contact Agent

**Demo Duration**: 3-5 minutes

---

## Live Demo Script

### 🎯 **Demo Input**
*Copy this into the Demo UI:*

```
I just returned from a business trip to London on March 15-17, 2025. I need you to process my complete expense report with multi-agent collaboration:

EXPENSES TO PROCESS:
1. Taxi from Heathrow to hotel: £45 (March 15, 2025) - Transportation for business travel
2. Business dinner with 3 clients from TechCorp: £180 (March 16, 2025) - Client entertainment and relationship building  
3. Hotel stay for 2 nights: £320 (March 15-17, 2025) - Accommodation for business meetings
4. Return taxi to airport: £38 (March 17, 2025) - Transportation for business travel

REQUIRED ACTIONS:
- Convert ALL four GBP amounts to USD in one batch
- Process complete expense report with proper categorization
- Extract and organize TechCorp client contact information for CRM
- Update financial records and provide budget impact analysis
- Generate executive summary of trip costs and ROI

Please coordinate between your currency, expense, contact, and data agents to handle this end-to-end. I need the complete workflow processed automatically without manual forms.
```

---

## Expected Agent Workflow

### 🌍 **Currency Agent** (First)
• Converts all GBP amounts to USD using live rates
• Provides exchange rate information and timestamps
• Calculates total trip cost in company currency

**Expected Output:**
- £45 → $57.15 (Taxi)
- £180 → $228.60 (Dinner)
- £320 → $406.40 (Hotel)
- £38 → $48.26 (Taxi)
- **Total: $740.41 USD**

### 💰 **Expense Agent** (Second)
• Categorizes each expense automatically
• Validates against company travel policy
• Generates expense report with proper coding

**Expected Output:**
- Transportation: $105.41 (Taxis)
- Accommodation: $406.40 (Hotel)
- Meals & Entertainment: $228.60 (Client dinner)
- **Status: All expenses approved**

### 👥 **Contact Agent** (Third)
• Extracts client information from dinner context
• Creates contact records for TechCorp attendees
• Links contacts to expense for audit trail

**Expected Output:**
- 3 new contacts from TechCorp identified
- Business dinner context recorded
- CRM integration completed

### 📊 **Data Agent** (Fourth)
• Updates financial database with new expenses
• Provides budget impact analysis
• Generates executive summary

**Expected Output:**
- Q1 travel budget: 78% utilized
- London trip ROI analysis
- Expense trend comparison

---

## Key Demonstration Points

### 🤝 **Agent Collaboration**
• **Seamless handoffs** between specialized agents
• **Data sharing** without manual intervention
• **Intelligent routing** based on task requirements

### ⚡ **Business Value**
• **Time savings**: 5-minute manual process → 30 seconds
• **Accuracy**: Eliminates currency conversion errors
• **Compliance**: Automatic policy validation
• **Insights**: Real-time budget impact analysis

### 🔧 **Technical Excellence**
• **Real-time processing** with live exchange rates
• **Multi-system integration** (CRM, accounting, databases)
• **Audit trail** for compliance and tracking

---

## Audience Talking Points

### 💼 **For Executives**
*"This demonstrates how AI agents eliminate the friction in routine business processes while providing real-time insights for better decision-making."*

### 🏢 **For IT Leaders**
*"Notice how different AI frameworks (LangGraph, Google ADK, Marvin, MindsDB) work together seamlessly through the A2A protocol."*

### 💰 **For Finance Teams**
*"The system ensures policy compliance, accurate currency conversion, and provides immediate budget impact analysis."*

---

## Troubleshooting

### 🔧 **If Agents Don't Respond**
1. Check agent status: `./status_agents.sh`
2. Restart if needed: `./start_all_agents.sh`
3. Verify Demo UI connection to agents

### 📊 **If Data Agent Has No Data**
*Explain: "In a real deployment, this would connect to your existing financial systems. For this demo, we're showing the integration capability."*

### 💱 **If Currency Rates Seem Off**
*Note: "These are live exchange rates. The exact amounts will vary based on current market conditions."*

---

**Next Scenario:** [Sales Pipeline Analysis →](scenario-02-sales-pipeline.md)

---

## Navigation
- [← Back to Data Agent](../agents/data-agent.md)
- [Sales Pipeline Analysis →](scenario-02-sales-pipeline.md)
- [Content Creation Pipeline →](scenario-03-content-creation.md)
- [Travel Planning Demo →](scenario-04-travel-planning.md)
- [Market Research →](scenario-05-market-research.md) 