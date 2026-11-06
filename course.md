A self-study version of Zach Wilson's **Senior AI Analytics Engineering Boot Camp** ($2,400), rebuilt from free resources. Same 5-week spine, same deliverables, zero cost beyond a Snowflake 30-day trial.

> **How to use this page:** work one week at a time, do the lab before moving on, and push every lab to a public GitHub repo (`ai-analytics-engineering-bootcamp`). The repo *is* the capstone.
> 

## Setup (do once, ~1 hour)

- [ ]  [Snowflake free trial](https://signup.snowflake.com/) — pick **Enterprise** edition, AWS us-west-2 (some Cortex quickstarts require it)
- [ ]  Clone Zach's open-source handbooks: [data-engineer-handbook](https://github.com/DataExpert-io/data-engineer-handbook) and [analytics-engineer-handbook](https://github.com/DataExpert-io/analytics-engineer-handbook) — the [`intermediate-bootcamp/materials`](https://github.com/DataExpert-io/data-engineer-handbook/tree/main/intermediate-bootcamp/materials) folder (in data-engineer-handbook) has the free bootcamp labs and datasets; analytics-engineer-handbook is a reading/resource list
- [ ]  Local toolchain: Python 3.12 + `uv`, `dbt-core` + `dbt-snowflake`, Docker Desktop, [Astro CLI](https://www.astronomer.io/docs/astro/cli/install-cli) (Airflow in one command)
- [ ]  Install [Cortex Code (CoCo)](https://www.snowflake.com/en/developers/guides/get-started-coco-vscode-extension/) via the Snowflake VS Code extension, plus [Claude Code](https://docs.claude.com/en/docs/claude-code/overview)
- [ ]  Free account at [Astronomer Academy](https://academy.astronomer.io) and [dbt Learn](https://learn.getdbt.com)

---

## Week 1 — Unstructured Data Modeling on Snowflake

*Paid-course topics: PDF processing best practices · building & optimizing vectors · testing unstructured data quality · scaling + cost management · end-to-end RAG with Cortex AI*

| Topic | Free resource | Time |
| --- | --- | --- |
| PDF parsing & chunking | [Compare and Evaluate Chunking Strategies](https://www.snowflake.com/en/developers/guides/compare-and-evaluate-chunking-strategies/) (Snowflake quickstart, uses `AI_PARSE_DOCUMENT` on 10-K PDFs) | 2 h |
| Chunking functions | Docs: [SPLIT_TEXT_RECURSIVE_CHARACTER](https://docs.snowflake.com/en/sql-reference/functions/split_text_recursive_character-snowflake-cortex) and the [RAG document-preprocessing blog](https://snowflake.com/en/blog/streamline-rag-document-preprocessing) | 1 h |
| Vectors & retrieval | [Build a RAG App with Streamlit and Snowflake Cortex](https://www.snowflake.com/en/developers/guides/build-rag-app-with-streamlit-and-snowflake-cortex/) (distilled from #30DaysOfAI — covers embeddings, Cortex Search, guardrails) | 3 h |
| Testing RAG quality | [Getting Started with LLMOps using Cortex and TruLens](https://www.snowflake.com/en/developers/guides/getting-started-with-llmops-using-snowflake-cortex-and-trulens/)  • [AI Observability quickstart](https://quickstarts.snowflake.com/guide/getting_started_with_ai_observability) | 2 h |
| Cost & scaling | Snowflake docs: Cortex Search cost considerations, `TARGET_LAG`, warehouse sizing; run `QUERY_HISTORY` on your own lab | 1 h |
| Governance | [Access Controls for RAGs (Cortex Search)](https://www.snowflake.com/en/developers/guides/getting-started-with-access-controls-for-cortex-search/) | 1 h |

**Lab:** Load 10–20 PDFs of your choice → `PARSE_DOCUMENT` → chunk (test 2 chunk sizes) → Cortex Search service → Streamlit chatbot → TruLens groundedness/relevance eval. Commit the SQL + eval notebook.

---

## Week 2 — Building with Snowflake CoCo Agents

*Paid-course topics: intro to CoCo & agentic DE · generating SQL/Python/pipelines · Dynamic Tables with CoCo · custom agents & multi-agent workflows · testing/debugging AI-generated pipelines*

| Topic | Free resource | Time |
| --- | --- | --- |
| CoCo basics | [Getting Started with CoCo in VS Code](https://www.snowflake.com/en/developers/guides/get-started-coco-vscode-extension/) (build a data-quality stored proc by conversation) | 1.5 h |
| Agentic DE end-to-end | [Building AI Agents with Cortex Code and CoWork](https://www.snowflake.com/en/developers/guides/building-ai-agents-with-cortex-code-and-cowork/) — semantic views, agents, skills, evals from prompts | 3 h |
| Dynamic Tables | [Build Declarative Data Pipelines with Dynamic Tables](https://www.snowflake.com/en/developers/guides/snowflake-dynamic-tables-data-pipeline) (Tasty Bytes) + [Comprehensive Guide to Dynamic Tables](https://www.snowflake.com/en/developers/guides/comprehensive-guide-to-dynamic-tables/) — CoCo ships a `/dynamic-tables` skill | 2.5 h |
| Cortex Agents by hand | Docs: [Get started with Cortex Agents](https://docs.snowflake.com/en/user-guide/snowflake-cortex/cortex-agents-get-started) | 1.5 h |
| Custom tools / multi-agent | Snowflake-Labs sfguides skills: `cortex-agents-tutorial` and `cortex-agents-with-custom-tools-tutorial` ([skills.sh index](https://www.skills.sh/snowflake-labs/sfguides/cortex-code-tutorial)) | 2 h |
| Live lab (optional) | Snowflake webinar [Prompt to Pipeline: Hands-On DE with Cortex Code](https://www.snowflake.com/webinars/prompt-to-pipeline-hands-on-data-engineering-with-cortex-code-20261117/) — 17 Nov 2026, covers writing an `AGENTS.md` | 2 h |

**Lab:** Have CoCo scaffold a bronze→silver→gold Dynamic Tables pipeline on Tasty Bytes, then build a Cortex Agent with Analyst (semantic view) + Search (Week 1 service) + one custom stored-proc tool. Write an `AGENTS.md` with your conventions. Document every place the AI-generated SQL was wrong and how you caught it.

---

## Week 3 — Scaling Airflow DAGs in Production

*Paid-course topics: guaranteeing correct results · idempotent pipelines · data contracts + WAP on Iceberg · dynamic task mapping, concurrency, resources · monitoring/debugging/recovery*

| Topic | Free resource | Time |
| --- | --- | --- |
| Airflow foundations | [Astronomer Academy — Airflow 101 path](https://academy.astronomer.io/page/apache-airflow) (free, certificate available) | 4 h |
| Idempotency & backfills | Zach's free YouTube bootcamp, *Airflow / data quality patterns* module ([handbook materials](https://github.com/DataExpert-io/data-engineer-handbook/tree/main/intermediate-bootcamp/materials)); Astronomer guide on `catchup`/backfill | 2 h |
| Dynamic task mapping | Academy: [Airflow: Dynamic Task Mapping](https://academy.astronomer.io/astro-runtime-dynamic-task-mapping)  • [Project: DTM with S3](https://academy.astronomer.io/project-dynamic-task-mapping-with-s3); [Create dynamic Airflow tasks](https://www.astronomer.io/docs/learn/dynamic-tasks) | 2 h |
| Concurrency & resources | Academy modules: Pools, Deferrable Operators; Airflow docs on `max_active_runs`, `max_active_tis_per_dag` | 1.5 h |
| WAP on Iceberg | [WAP pattern with Iceberg branches + full Airflow DAG](https://iceberglakehouse.com/iceberg/iceberg-wap-pattern/), [Dremio: WAP & branching](https://dremio.com/?p=13827), [lakeFS: how to implement WAP](https://lakefs.io/blog/how-to-implement-write-audit-publish/) | 2 h |
| Data contracts | Open-source [tollkeeper](https://pypi.org/project/tollkeeper/) (WAP library with Airflow + Iceberg backends) as a reference implementation | 1 h |
| Monitoring & recovery | Academy: Airflow: Debug DAGs; Airflow docs on callbacks, SLAs, `retries`, clearing task instances | 1.5 h |

**Lab:** Astro CLI project with one DAG that (1) uses dynamic task mapping over a list of partitions, (2) writes to an Iceberg staging branch, (3) runs audits (row count, nulls, freshness) as a data contract, (4) fast-forwards to `main` only on pass, and (5) is fully re-runnable for any date. Deliberately break it and recover via backfill.

---

## Week 4 — dbt Fundamentals & Data Quality

*Paid-course topics: dbt + analytics engineering intro · project structure/sources/models · materializations & dimensional modeling · tests/docs/lineage · WAP with dbt*

| Topic | Free resource | Time |
| --- | --- | --- |
| dbt core skills | [dbt Fundamentals](https://learn.getdbt.com/courses/dbt-fundamentals) (official, free, ~5 h, Snowflake-compatible) | 5 h |
| Project structure | dbt docs best-practice guide *How we structure our dbt projects* (staging / intermediate / marts) | 1 h |
| Dimensional modeling | Zach's free bootcamp — *Dimensional Data Modeling* week ([handbook week 1](https://github.com/DataExpert-io/data-engineer-handbook/tree/main/intermediate-bootcamp/materials/1-dimensional-data-modeling)): cumulative tables, SCDs; Kimball concepts | 4 h |
| Tests, docs, lineage | Covered in dbt Fundamentals; add `dbt-expectations` / `dbt-utils` packages for richer tests | 1 h |
| WAP with dbt | dbt Discourse: *Performing a blue/green deploy of your dbt project on Snowflake* (swap schema/`ALTER TABLE SWAP WITH`); run `dbt build` into a staging schema, gate on tests, then swap | 1.5 h |

**Lab:** Rebuild your Week 2 gold layer in dbt (sources → staging → dim/fact marts with one SCD Type 2). ≥10 tests, full docs, `dbt docs generate` lineage screenshot. Implement WAP: build to `_audit` schema, test, swap to prod — wired as an Airflow DAG via Cosmos or `BashOperator`.

---

## Week 5 — Advanced dbt, AI & Semantic Layer

*Paid-course topics: incremental models, Jinja, macros · AI-assisted dbt with Claude Code + MCP · orchestrating dbt with Airflow · semantic models/metrics · MetricFlow*

| Topic | Free resource | Time |
| --- | --- | --- |
| Incremental models, Jinja, macros | dbt Learn: *Advanced Materializations* and *Jinja, Macros, Packages* courses (free); dbt docs on incremental strategies for Snowflake (`merge`, `delete+insert`) | 3 h |
| Claude Code + dbt MCP | [dbt-mcp (GitHub)](https://github.com/dbt-labs/dbt-mcp) — works with dbt Core locally; [setup walkthrough](https://apidog.com/blog/dbt-mcp-server-guide); [Using MCP with Claude Code](https://rapidevelopers.com/mcp-tutorial/how-to-use-mcp-with-claude-code); dbt Labs' open-source *dbt-agent-skills* (e.g. `building-dbt-semantic-layer`) | 2.5 h |
| Orchestrating dbt with Airflow | Astronomer guide *Orchestrate dbt Core with Cosmos* (free docs); Academy module on dbt + Airflow | 1.5 h |
| Semantic models & metrics | dbt best-practice guide [How we build our metrics](https://docs.getdbt.com/best-practices/how-we-build-our-metrics/semantic-layer-1-intro)  • [Build your metrics](https://docs.getdbt.com/docs/build/build-metrics-intro) | 2 h |
| MetricFlow (free, local) | MetricFlow is Apache-2.0 since Oct 2025: `uv pip install "dbt-metricflow[dbt-snowflake]"`, then `mf validate-configs` / `mf query`. [Semantic Layer on-demand course](https://learn.getdbt.com/courses/semantic-layer) (free) | 2 h |

**Lab:** Convert two marts to incremental with a custom macro; add a `metricflow_time_spine`; define 3 semantic models + 5 metrics (incl. one cumulative, one ratio); query them with `mf query`. Use Claude Code + dbt-mcp to generate a new model and tests, then review and fix its output. Schedule the whole project with Cosmos in Airflow.

---

## Bonus — Meta's Analytical Patterns (the paid syllabus includes this module)

| Topic | Free resource |
| --- | --- |
| Growth accounting | Zach's free bootcamp *Analytical Patterns* lecture + lab ([handbook materials](https://github.com/DataExpert-io/data-engineer-handbook/tree/main/intermediate-bootcamp/materials/4-applying-analytical-patterns)) — new/retained/resurrected/churned state transitions |
| Change Data Capture | Snowflake docs: Streams & Tasks tutorial; compare with Dynamic Tables (Week 2) |
| SCD + read streams | Handbook week 1 SCD lab; Snowflake `CHANGES` clause docs |
| Snowflake + Glue Catalog / Iceberg | Snowflake docs: *Create your first Apache Iceberg table* and Glue catalog integration |

---

## Capstone (replaces the bootcamp's capstone showcase)

One repo, one README, one Loom walkthrough:

1. Raw PDFs + structured events land in Snowflake
2. Airflow (dynamic mapping, WAP on Iceberg) orchestrates ingestion
3. dbt builds dims/facts, incremental marts, tests, docs
4. MetricFlow semantic layer exposes metrics
5. A Cortex Agent answers questions over both the semantic view and the Cortex Search service
6. CoCo/Claude Code used throughout — with a `AGENTS.md` and a log of AI mistakes caught

Post it on LinkedIn week by week; that is what the paid cohort's "portfolio" deliverable amounts to.

## What you give up vs. the paid course

- Live Q&A with Zach, TA office hours, certificate, community/Slack
- Zach's specific lecture framing (though the free YouTube bootcamp covers much of the same ground)
- Pre-provisioned Snowflake/AWS environments — you manage your own trial + credits

**Total estimated effort:** ~70–80 hours over 5–6 weeks, roughly the same as the paid cohort.