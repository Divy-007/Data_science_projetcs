import sqlite3
from utils.id_generator import generate_question_id
from scrapers.gfg_scraper import scrape_site1
from scrapers.agile_mania_scraper import scrape_site2


def main():
    data = scrape_site1(
        "https://www.geeksforgeeks.org/data-science/data-science-interview-questions-and-answers/"
    )
    data += scrape_site2(
        "https://agilemania.com/software-developer-interview-questions"
    )

    conn = sqlite3.connect("questions.db")
    cur = conn.cursor()

    cur.execute("""
    CREATE TABLE IF NOT EXISTS questions (
        question_id TEXT PRIMARY KEY,
        question TEXT,
        answer TEXT,
        topic TEXT,
        difficulty_level TEXT
    )
    """)

    for d in data:
        q_id = generate_question_id(d["questions"])
        

        cur.execute("""
            INSERT OR IGNORE INTO questions
            VALUES (?, ?, ?, ?, ?)
        """, (
            q_id,
            d["questions"],
            d["answers"],
            d["topics"],
            d["difficulty_level"]
        ))

    conn.commit()
    conn.close()

    print("✅ questions.db created (deduplicated)")


if __name__ == "__main__":
    main()
