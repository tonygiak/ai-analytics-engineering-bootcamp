# AI Analytics Engineering Bootcamp (self-study)

A 5-week, self-paced build of a modern AI analytics engineering stack on Snowflake: unstructured data and RAG with Cortex, AI-assisted pipelines with Cortex Code, production Airflow, dbt, and a MetricFlow semantic layer.

The full syllabus and resources are in [course.md](course.md).

## Stack

Snowflake (Cortex AI, Cortex Search, Dynamic Tables, Iceberg) · dbt-core + dbt-snowflake · MetricFlow · Apache Airflow (Astro CLI, Cosmos) · Python 3.12 + uv · Claude Code + Cortex Code

## Progress

| Week | Topic | Lab | Status |
|---|---|---|---|
| 1 | Unstructured data modeling & RAG | [week1-unstructured-rag](week1-unstructured-rag/) | ⬜ |
| 2 | Building with Cortex Code agents | [week2-coco-agents](week2-coco-agents/) | ⬜ |
| 3 | Scaling Airflow DAGs in production | [week3-airflow](week3-airflow/) | ⬜ |
| 4 | dbt fundamentals & data quality | [week4-dbt-fundamentals](week4-dbt-fundamentals/) | ⬜ |
| 5 | Advanced dbt, AI & semantic layer | [week5-dbt-advanced-semantic](week5-dbt-advanced-semantic/) | ⬜ |
| — | Capstone | [capstone](capstone/) | ⬜ |

## Local setup

```powershell
uv venv --python 3.12
.venv\Scripts\activate
uv pip install -r requirements.txt
dbt --version   # should show dbt-core, not dbt-fusion
```
