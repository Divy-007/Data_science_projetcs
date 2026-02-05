from scrapers.gfg_scraper import scrape_site1
from database.insert_questions import insert_questions


def run_pipeline():
    url = "PASTE_THE_WEBSITE_URL_HERE"

    data = scrape_site1(url)
    insert_questions(data)

    print(f"✅ Pipeline complete. Records processed: {len(data)}")


if __name__ == "__main__":
    run_pipeline()
