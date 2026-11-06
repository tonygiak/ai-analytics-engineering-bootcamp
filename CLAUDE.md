# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A self-study, 5-week AI analytics engineering bootcamp on Snowflake. `course.md` is the syllabus and the source of truth for what each week's lab must deliver; `README.md` tracks progress (update the Status column when a lab is finished). The repo is meant to be public and is itself the capstone portfolio.

Currently a scaffold: the week folders contain only `.gitkeep`. Code is added lab by lab.

## Layout and how the pieces connect

Each `weekN-*/` folder is a self-contained lab, but later weeks build on earlier outputs, so read `course.md` for the dependency before starting a lab:

- `week1-unstructured-rag/` — PDFs → `AI_PARSE_DOCUMENT` → chunking → Cortex Search service → Streamlit chatbot → TruLens eval (SQL + notebook).
- `week2-coco-agents/` — bronze→silver→gold Dynamic Tables pipeline (Tasty Bytes), plus a Cortex Agent that reuses the **Week 1 Cortex Search service**. Includes an `AGENTS.md` of conventions.
- `week3-airflow/` — Astro CLI project: dynamic task mapping, write-audit-publish (WAP) on Iceberg branches, idempotent/backfillable for any date.
- `week4-dbt-fundamentals/` — dbt project that rebuilds the **Week 2 gold layer** (sources → staging → dim/fact marts, one SCD2), WAP via an `_audit` schema + swap, triggered from Airflow (Cosmos or `BashOperator`).
- `week5-dbt-advanced-semantic/` — extends the Week 4 project: incremental models with a custom macro, `metricflow_time_spine`, semantic models + metrics, scheduled with Cosmos.
- `capstone/` — ties all of the above together end to end (see the Capstone section of `course.md`).

When a week's folder gains its own `AGENTS.md` or README, follow it for work inside that folder.

## Environment and commands

Windows, PowerShell, Python 3.12 managed with `uv` (virtualenv at `.venv/`).

```powershell
uv venv --python 3.12
.venv\Scripts\activate
uv pip install -r requirements.txt
dbt --version   # must show dbt-core, not dbt-fusion
```

- `requirements.txt` pins `dbt-core` and `dbt-snowflake`; keep them on matching minor versions.
- MetricFlow (Week 5) is installed separately: `uv pip install "dbt-metricflow[dbt-snowflake]"`, then `mf validate-configs` / `mf query`.
- Airflow runs via the Astro CLI (Docker Desktop required).

dbt commands (run from inside the dbt project directory once it exists):

```powershell
dbt build                          # run + test everything
dbt build --select <model_name>    # one model and its tests
dbt test --select <model_or_test>  # a single model's tests or one test
dbt docs generate
```

## Secrets

Snowflake credentials live outside the repo. `.gitignore` excludes `profiles.yml`, `connections.toml`, `.env*`, and key files (`*.p8`, `*.pem`, `*.key`). Never create these inside tracked paths or reference credentials in committed code; use `~/.dbt/profiles.yml` and `~/.snowflake/connections.toml` or env vars.

## Course-specific expectations

- The labs require documenting where AI-generated SQL/code was wrong and how it was caught (Week 2, Week 5, capstone). When Claude-generated code is corrected, note it so it can be added to that log.
- Pipelines must be idempotent and re-runnable for any date (Week 3+); prefer patterns that support backfills.
