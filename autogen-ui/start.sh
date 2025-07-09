#!/bin/bash

# LLM Committee AutoGen Studio Startup Script

echo "🚀 Starting LLM Committee System with AutoGen Studio..."

# Check environment variables
if [ -z "$OPENAI_API_KEY" ]; then
    echo "⚠️  Warning: OPENAI_API_KEY not set"
fi

if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo "⚠️  Warning: ANTHROPIC_API_KEY not set"
fi

if [ -z "$GOOGLE_API_KEY" ]; then
    echo "⚠️  Warning: GOOGLE_API_KEY not set"
fi

if [ -z "$WINDMILL_BASE_URL" ]; then
    echo "⚠️  Warning: WINDMILL_BASE_URL not set, using default"
    export WINDMILL_BASE_URL="http://windmill:8000"
fi

if [ -z "$WINDMILL_TOKEN" ]; then
    echo "⚠️  Warning: WINDMILL_TOKEN not set, Windmill integration will be limited"
fi

# Create AutoGen Studio data directory
mkdir -p /app/data

# Set database path for AutoGen Studio
export AUTOGENSTUDIO_DATABASE_PATH="/app/data/database.sqlite"

# Copy committee configuration
cp /app/committee_agents.json /app/data/

echo "🤖 LLM Committee Agents:"
echo "  - Workflow Proposer (GPT-4o)"
echo "  - Workflow Critic (Claude 3.5 Sonnet)"
echo "  - Technical Analyst (Gemini 1.5 Pro)"
echo "  - Committee Voter (GPT-4o)"
echo "  - Workflow Implementer (GPT-4o)"

echo ""
echo "🔧 Windmill Integration:"
echo "  - Base URL: $WINDMILL_BASE_URL"
echo "  - Tools: list_workflows, execute_workflow, create_script, create_workflow"

echo ""
echo "📊 Starting AutoGen Studio on port 8080..."

# Start AutoGen Studio with committee configuration
autogenstudio ui \
    --host=0.0.0.0 \
    --port=8080 \
    --config=/app/data/committee_agents.json \
    --database-path=/app/data/database.sqlite
