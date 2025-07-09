# LLM Agent Committee System

A sophisticated multi-agent system that uses a committee of Large Language Models to collaboratively propose, debate, vote on, and implement new workflows and automation tools using **AutoGen Studio** and **Windmill.dev**.

## 🎯 System Overview

This system combines the power of multiple LLMs in a democratic decision-making process:

- **AutoGen Studio**: Visual interface for multi-agent conversations and committee workflows
- **Windmill.dev**: Workflow execution engine and tool factory
- **Committee Agents**: Specialized LLM agents with distinct roles and responsibilities
- **Infrastructure**: Postgres, Redis, and Qdrant for data persistence and vector operations

## 🤖 Committee Agents

### 1. Workflow Proposer (GPT-4o)
- **Role**: Propose new workflows, scripts, and automation ideas
- **Capabilities**: Analyze business requirements, design technical solutions
- **Tools**: Can create scripts, workflows, and test existing implementations

### 2. Workflow Critic (Claude 3.5 Sonnet)
- **Role**: Critically evaluate proposals for flaws and improvements
- **Focus**: Security, performance, maintainability, integration risks
- **Tools**: Analyze existing workflows and test implementations

### 3. Technical Analyst (Gemini 1.5 Pro)
- **Role**: Deep technical analysis and feasibility assessment
- **Output**: Feasibility scores, resource estimates, risk matrices
- **Tools**: Study implementations and perform validation testing

### 4. Committee Voter (GPT-4o)
- **Role**: Facilitate democratic decision-making and consensus building
- **Methods**: Simple majority, ranked choice, weighted scoring
- **Responsibility**: Ensure fair voting processes and conflict resolution

### 5. Workflow Implementer (GPT-4o)
- **Role**: Execute approved proposals by creating actual implementations
- **Standards**: Production-ready code, comprehensive testing, documentation
- **Tools**: Full access to Windmill creation and deployment tools

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    AutoGen Studio                           │
│              (Committee Interface)                          │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  🤖 Committee Agents                                │   │
│  │  ├── Proposer → Critic → Analyst → Voter → Impl.   │   │
│  │  └── Visual workflow canvas & group chat           │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────┬───────────────────────────────────┘
                          │ (API calls & tool usage)
┌─────────────────────────┴───────────────────────────────────┐
│                  Windmill.dev                               │
│              (Workflow Engine)                              │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  🔧 Tools & Capabilities                           │   │
│  │  ├── Script creation (Python/TypeScript)          │   │
│  │  ├── Workflow orchestration                       │   │
│  │  ├── Job execution & monitoring                   │   │
│  │  └── API endpoints for agent integration          │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────┬───────────────────────────────────┘
                          │ (data persistence)
┌─────────────────────────┴───────────────────────────────────┐
│                   Data Layer                                │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐        │
│  │ PostgreSQL  │  │    Redis    │  │   Qdrant    │        │
│  │ (main data) │  │ (cache/queue│  │ (vectors)   │        │
│  └─────────────┘  └─────────────┘  └─────────────┘        │
└─────────────────────────────────────────────────────────────┘
```

## 🚀 Quick Start

### Prerequisites
- Docker & Docker Compose
- DigitalOcean account (for deployment)
- API keys for OpenAI, Anthropic, and Google

### Local Development

1. **Clone and setup**:
```bash
git clone <your-repo>
cd multi-llm-windmill-system
cp .env.template .env
# Edit .env with your API keys
```

2. **Start services**:
```bash
docker-compose up -d
```

3. **Access interfaces**:
- **AutoGen Studio**: http://localhost:8080 (Committee UI)
- **Windmill**: http://localhost:8000 (Workflow Engine)

### DigitalOcean Deployment

The system auto-deploys to DigitalOcean App Platform using `.do/app.yaml`:

1. **Push to main branch** - triggers automatic deployment
2. **Set environment variables** in DigitalOcean console:
   - `OPENAI_API_KEY`
   - `ANTHROPIC_API_KEY` 
   - `GOOGLE_API_KEY`
   - `WINDMILL_TOKEN`

3. **Access deployed system**:
   - Committee UI: `https://llm-agent-committee.ondigitalocean.app`
   - Windmill: `https://llm-agent-committee.ondigitalocean.app/windmill`

## 🔧 Windmill Integration

The committee agents can interact with Windmill through these tools:

- **`list_workflows()`**: View existing workflows and scripts
- **`execute_workflow(flow_path, args)`**: Run workflows with parameters
- **`create_script(path, content)`**: Create new Python/TypeScript scripts
- **`create_workflow(path, definition)`**: Build new workflow definitions

### Example Committee Workflow

1. **User Request**: "Create a daily report generator"
2. **Proposer**: Designs workflow architecture and implementation plan
3. **Critic**: Identifies security concerns and performance issues
4. **Analyst**: Provides feasibility score and resource estimates
5. **Voter**: Facilitates discussion and organizes voting process
6. **Implementer**: Creates actual Windmill scripts and workflows

## 📊 Features

### AutoGen Studio Interface
- **Visual workflow canvas** for agent interactions
- **Group chat interface** for committee discussions
- **Agent configuration** with custom prompts and tools
- **Execution monitoring** and debugging capabilities

### Windmill Capabilities
- **Python & TypeScript** script execution
- **Workflow orchestration** with complex logic
- **Database integrations** (Postgres, Redis)
- **External API** connections
- **Scheduling & triggers** for automated execution

### Committee Decision Making
- **Proposal submission** with structured templates
- **Multi-perspective evaluation** from specialized agents
- **Democratic voting** with multiple voting methods
- **Implementation tracking** and status reporting

## 🛠️ Development

### Project Structure
```
multi-llm-windmill-system/
├── autogen-ui/              # AutoGen Studio configuration
│   ├── committee_config.py  # Agent definitions and Windmill tools
│   ├── committee_agents.json # AutoGen Studio configuration
│   ├── requirements.txt     # Python dependencies
│   └── Dockerfile          # Container configuration
├── .wm/                    # Windmill workspace
│   ├── flows/              # Workflow definitions
│   ├── scripts/            # Python/TypeScript scripts
│   └── components/         # Reusable components
├── .do/                    # DigitalOcean deployment
│   └── app.yaml           # Multi-service configuration
├── docker-compose.yml     # Local development stack
└── README.md              # This file
```

### Adding New Agents

1. **Define agent** in `autogen-ui/committee_config.py`
2. **Add configuration** to `autogen-ui/committee_agents.json`
3. **Specify tools** and system prompts
4. **Test locally** with Docker Compose
5. **Deploy** by pushing to main branch

### Creating Windmill Tools

Agents can create new tools by implementing Python functions that:
- Follow Windmill's function signature patterns
- Include proper type hints and documentation
- Handle errors gracefully with meaningful messages
- Return structured data for downstream processing

## 🔐 Security

- **API key management** through environment variables
- **Token-based authentication** for Windmill integration
- **Input validation** in all agent tools
- **Network isolation** between services
- **Database security** with managed DigitalOcean Postgres

## 📈 Monitoring

- **AutoGen Studio** provides built-in conversation monitoring
- **Windmill** includes job execution tracking and logs
- **DigitalOcean** provides application metrics and alerts
- **Database** monitoring through managed service dashboard

## 🤝 Contributing

1. Fork the repository
2. Create feature branch: `git checkout -b feature/amazing-feature`
3. Test changes locally with Docker Compose
4. Commit changes: `git commit -m 'Add amazing feature'`
5. Push to branch: `git push origin feature/amazing-feature`
6. Open Pull Request

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Microsoft AutoGen**: Multi-agent conversation framework
- **Windmill Labs**: Workflow execution platform
- **OpenAI, Anthropic, Google**: LLM providers
- **DigitalOcean**: Cloud infrastructure platform
