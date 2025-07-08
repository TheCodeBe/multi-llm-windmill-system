# LLM Agent Committee Setup

This project deploys a Windmill-based system on DigitalOcean that uses a committee of LLMs (Claude, GPT-4, Gemini) to propose, debate, vote, and install new workflows.

## Setup Steps
1. Clone this repo
2. Create a `.env` file based on `.env.template`
3. Run `docker compose up -d`
4. Access Windmill at `http://<droplet-ip>:8000`

The `.wm/` folder includes:
- Flows
- Scripts to call LLMs
- Voting, logging, and workflow installation logic
