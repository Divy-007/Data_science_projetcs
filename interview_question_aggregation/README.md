Interview Question Aggregation Pipeline

A multi-source data ingestion pipeline that scrapes interview questions from multiple websites, normalizes them, and stores them in PostgreSQL with deterministic deduplication. The system is designed to be modular, reproducible, and extensible.

🚀 Project Overview

This project aggregates interview questions and answers from multiple public websites and stores them in a structured PostgreSQL database. Each source has its own scraper, while all data flows into a shared schema with hash-based deduplication.

Key goals:

Reliable scraping from heterogeneous HTML structures

Clean separation of concerns (scraping, transformation, storage)

Idempotent ingestion (safe to re-run)

Future-ready for enrichment (e.g. AI-generated answers)

🧱 Architecture
Websites
   │
   ├── Scraper (Site 1)
   ├── Scraper (Site 2)
   ├── Scraper (Site 3)
   │
   ▼
Normalized Records
   │
   ▼
PostgreSQL (core.questions)

Design Principles

One scraper per site (no universal scraper hacks)

Database is the source of truth

Scraping ≠ Enrichment

Fail-safe parsing (ignore > misclassify)

📁 Project Structure
interview_question_aggregation/
│
├── scrapers/
│   ├── gfg_scraper.py
│   ├── site2_scraper.py
│   ├── site3_scraper.py
│   └── __init__.py
│
├── database/
│   ├── connection.py
│   ├── insert_questions.py
│   └── __init__.py
│
├── utils/
│   ├── id_generator.py
│   └── __init__.py
│
├── scripts/
│   ├── run_pipeline.py
│   ├── test_scraper.py
│   ├── test_scraper_site2.py
│   └── test_scraper_site3.py
│
├── README.md
└── requirements.txt

🗄️ Database Schema

Table: core.questions

Column	Type	Description
question_id	TEXT (PK)	SHA-256 hash of normalized question
questions	TEXT	Interview question
answers	TEXT	Answer (nullable)
topics	TEXT	Topic / category
difficulty_level	TEXT	Difficulty (nullable)
is_ai_generated	BOOLEAN	Flag for AI-generated answers
Deduplication Strategy

question_id is generated using a SHA-256 hash of normalized question text.

Inserts use ON CONFLICT DO NOTHING.

Running the pipeline multiple times does not create duplicates.

🔑 Question ID Generation
def generate_question_id(question_text):
    normalized = " ".join(question_text.lower().strip().split())
    return hashlib.sha256(normalized.encode("utf-8")).hexdigest()


This ensures:

Case insensitivity

Whitespace normalization

Deterministic uniqueness across sources

🕷️ Scraping Strategy
Common Rules

Questions are treated as primary data

Answers are optional

If an answer is missing → stored as NULL

No fake placeholders like "Not available"

Site Handling

Each site has:

Independent parsing logic

Conservative classification rules

Explicit stop conditions for answer extraction

This avoids:

Topic leakage into difficulty

Partial answers

Structural assumptions

▶️ How to Run
1️⃣ Install dependencies
pip install -r requirements.txt

2️⃣ Configure PostgreSQL

Update credentials in:

database/connection.py

3️⃣ Run the pipeline
python -m scripts.run_pipeline


Expected output:

Pipeline started
Site 1 records: XX
Site 2 records: XX
Site 3 records: XX
Pipeline finished


Re-running the command will not duplicate data.

🧪 Testing

Each scraper can be tested independently:

python -m scripts.test_scraper
python -m scripts.test_scraper_site2
python -m scripts.test_scraper_site3


This isolates failures and simplifies debugging.

🤖 AI Enrichment (Planned)

AI is treated as an enrichment layer, not a data source.

Planned behavior:

Only fill rows where answers IS NULL

Never overwrite scraped answers

Mark AI answers with is_ai_generated = TRUE

Run as a separate script, not part of the main pipeline

This keeps the dataset honest and auditable.

🚫 Why Selenium Is Not Used

Selenium was intentionally avoided because:

It introduces unnecessary complexity

It is slow and fragile for text extraction

It breaks CLI and server-side automation

The project focuses on data pipelines, not browser automation

Only static, scrape-friendly sources were chosen.

📈 Future Improvements

AI-based answer enrichment

Topic normalization

Difficulty inference

Scheduled ingestion

API layer for querying questions

🧠 Key Takeaways

Robust scraping is about structure, not assumptions

Ignoring ambiguous data is safer than misclassifying it

Separation of concerns makes systems extensible

Reproducibility > raw volume