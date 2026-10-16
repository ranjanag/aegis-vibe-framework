# Aegis Vibe Framework

> **Spec-Driven Vibe Coding & Multi-Agent Orchestration Engine**
> *Turn ideas into verified software without agent hallucinations, rule drift, or context amnesia.*

The **Aegis Vibe Framework** turns unstructured "vibe coding" into an enterprise-safe development workflow. It establishes `/docs` as the single source of truth for your codebase, keeps agent behavior consistent across **Google Antigravity**, **Claude Code**, **Devin**, and **Cursor**, and enables zero-cost context switching across tools using native filesystem links.

---

## Table of Contents

* [Architecture & Core Concepts](https://www.google.com/search?q=%23architecture--core-concepts)
* [Directory Structure](https://www.google.com/search?q=%23directory-structure)
* [The 3-Tier Progressive Complexity](https://www.google.com/search?q=%23the-3-tier-progressive-complexity)
* [Quick Start](https://www.google.com/search?q=%23quick-start)
* [Environment Setup & Installation](https://www.google.com/search?q=%23environment-setup--installation)
* [Windows (PowerShell)](https://www.google.com/search?q=%23windows-powershell)
* [macOS (zsh / bash)](https://www.google.com/search?q=%23macos-zsh--bash)
* [Linux (bash)](https://www.google.com/search?q=%23linux-bash)


* [Daily Workflow: The Vibe Execution Loop](https://www.google.com/search?q=%23daily-workflow-the-vibe-execution-loop)
* [Switching Context Between IDEs & Agents](https://www.google.com/search?q=%23switching-context-between-ides--agents)
* [Security & Governance (MCP)](https://www.google.com/search?q=%23security--governance-mcp)

---

## Architecture & Core Concepts

Most AI coding agents fail because rules remain trapped in chat memory or in fragmented IDE configurations. When requirements are missing, **agents guess**.

Aegis solves this with a hub-and-spoke configuration model:

```
                      docs/AGENTS.md (Master Instructions)[cite: 1]
                                     │
         ┌───────────────────────────┼───────────────────────────┐
         ▼                           ▼                           ▼
   Claude Code CLI                 Devin                    IDEs (Cursor /
    (CLAUDE.md)          (.devin/instructions.md)       Antigravity / Windsurf)
                                                       (.cursorrules / .agents)

```

1. **Spec Contracts:** Product scope, architecture, API schemas, and security boundaries live in `/docs`.


2. **Zero-Drift Sync:** Operating-system hard links connect `docs/AGENTS.md` to `CLAUDE.md`, `.cursorrules`, `.agents/rules/`, and `.devin/instructions.md`. Edit the rule file once, and all agent environments update instantly.


3. **Continuous State Tracking:** `docs/STATE.md` maintains an active handoff ledger across agents, eliminating context resets when switching tools.

---

## Directory Structure

```text
aegis-vibe-framework/
├── docs/                        # The Single Source of Truth[cite: 1]
│   ├── AGENTS.md                # Universal agent rules & execution workflow[cite: 1]
│   ├── PRD.md                   # Product specs & acceptance criteria[cite: 1]
│   ├── ARCHITECTURE.md          # System design & directory boundaries[cite: 1]
│   ├── STATE.md                 # Cross-tool session handoff ledger
│   ├── DESIGN_SYSTEM.md         # Tokens, typography, layout rules[cite: 1]
│   ├── DATABASE.md              # Tables, relationships, and migration rules[cite: 1]
│   ├── API.md                   # Endpoint contracts & error formats[cite: 1]
│   └── SECURITY.md              # Auth boundaries & secret management[cite: 1]
│
├── .agents/rules/               # Google Antigravity IDE rules
├── .cursor/rules/               # Cursor / Windsurf rules
├── .devin/                      # Devin autonomous runner rules
├── .mcp/                        # Model Context Protocol policies
│   └── policies.json            # Least-privilege agent tool boundaries
├── scripts/
│   ├── sync-ide.ps1             # Windows sync automation
│   └── sync-ide.sh              # macOS/Linux sync automation
└── CLAUDE.md                    # Root link for Claude Code CLI

```

---

## The 3-Tier Progressive Complexity

To prevent documentation fatigue, use only the documents your project tier requires:

* **Level 1 — Prototype (UI / Idea Validation):** `PRD.md`, `DESIGN_SYSTEM.md`, `ARCHITECTURE.md`, `AGENTS.md`.


* **Level 2 — Core MVP (Data & Auth):** Adds `UX_FLOWS.md`, `DATABASE.md`, `API.md`, `SECURITY.md`, `TESTING.md`.


* **Level 3 — Enterprise / Production:** Adds `ENVIRONMENT.md`, `ERROR_HANDLING.md`, `DEPLOYMENT.md`, `OBSERVABILITY.md`, `DECISIONS.md`, `ROADMAP.md`, `CHANGELOG.md`.



---

## Quick Start

### 1. Scaffold and Initialize

Clone your repository or use the template:

```bash
git clone https://github.com/<your-org>/aegis-vibe-framework.git my-app
cd my-app

```

### 2. Run the Initial AI Bootstrap Prompt

Open your preferred agent or IDE in the project directory and paste:

> "I am starting a new project using the Vibe Coding Blueprint. Read `docs/AGENTS.md`. Do not write code yet. Help me define `docs/PRD.md` and `docs/ARCHITECTURE.md` based on my idea:
> 
> 
> *[Describe your product idea in 2–3 sentences]*
> *Ask me 3 essential questions before generating the specifications."*
> 

---

## Environment Setup & Installation

### Windows (PowerShell)

Windows uses native NTFS hard linking via PowerShell without requiring administrative privileges.

1. **Verify Execution Policy:**
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

```


2. **Run Sync Script:**
```powershell
.\scripts\sync-ide.ps1

```


*This establishes zero-drift links for `CLAUDE.md`, `.cursorrules`, `.devin\instructions.md`, and `.agents\rules\vibe-rules.md`.*
3. **Switch Agent Context:**
```powershell
.\scripts\sync-ide.ps1 "Claude Code"

```



---

### macOS (zsh / bash)

macOS creates native POSIX hard links via terminal.

1. **Grant Script Permissions:**
```bash
chmod +x scripts/sync-ide.sh

```


2. **Run Initial Link:**
```bash
./scripts/sync-ide.sh

```


3. **Switch Agent Context:**
```bash
./scripts/sync-ide.sh "Devin"

```



---

### Linux (bash / WSL)

On Debian, Ubuntu, Fedora, or WSL environments:

1. **Ensure Git and Coreutils are available:**
```bash
sudo apt update && sudo apt install -y git coreutils

```


2. **Set Execution Permissions and Sync:**
```bash
chmod +x scripts/sync-ide.sh
./scripts/sync-ide.sh

```


3. **Switch Agent Context:**
```bash
./scripts/sync-ide.sh "Antigravity"

```



---

## Daily Workflow: The Vibe Execution Loop

Never instruct an agent to simply "build an app" or generate large swaths of code directly. Use this 3-step loop:

### Step 1: Request an Implementation Plan

> "Read `docs/PRD.md` and `docs/ARCHITECTURE.md`. Provide an implementation plan and the blast radius for [Feature Name]. List all files to be modified, dependencies to add, and tests to write. Do not edit code yet."
> 
> 

### Step 2: Approve, Implement & Validate

After reviewing the plan, instruct the agent:

> "Proceed with the approved plan. Run test and lint checks to verify zero regressions before marking the task complete."
> 
> 

### Step 3: Checkpoint & State Update

Before closing your session or switching tools:

> *"Update `docs/STATE.md` with the work completed, modified files, and explicit next steps for the next session."*

---

## Switching Context Between IDEs & Agents

Move between local IDEs and autonomous cloud agents seamlessly:

| Scenario | From | To | Command | Prompt to Next Agent |
| --- | --- | --- | --- | --- |
| **Delegating background tasks** | Cursor / Antigravity | Devin | `./scripts/sync-ide.sh Devin` | *"Read `docs/STATE.md` and complete the items listed under Next Steps."* |
| **Local CLI refactoring** | Devin | Claude Code | `./scripts/sync-ide.sh "Claude Code"` | *"Inspect `docs/STATE.md` and continue the active implementation."* |
| **UI polishing** | Claude Code | Cursor / Antigravity | `./scripts/sync-ide.sh Cursor` | "Read `docs/STATE.md` and `docs/DESIGN_SYSTEM.md`. Refine layout without changing API routes."

 |

---

## Security & Governance (MCP)

To prevent package hallucinations (slopsquatting) and unauthorized file mutations, tools operating under Model Context Protocol (MCP) adhere to `.mcp/policies.json`:

* **Read Restrictions:** Agents can freely read `/src` and `/docs`.


* **Write Safeguards:** Write operations to `.env*`, `.github/`, or `docs/SECURITY.md` require explicit human-in-the-loop approval.


* **Package Verification:** Automated pre-commit hooks verify library names against approved package registries before installation commands execute.
