import requests
from bs4 import BeautifulSoup
import re

# InterviewBit does not allow scraping so we ignoring it here
# However, here is a sample scraper 
def scrape_site3(url: str):
    headers = {
        "User-Agent": "Mozilla/5.0"
    }

    response = requests.get(url, headers=headers)
    response.raise_for_status()

    soup = BeautifulSoup(response.text, "lxml")

    data = []
    current_topic = None

    for tag in soup.find_all(["h1", "h2"]):
        text = tag.get_text(strip=True)

        if tag.name == "h1":
            current_topic = text
            continue

        if tag.name == "h2":
            if not text or not text[0].isdigit():
                continue

            question_text = re.sub(r"^\d+\.\s*", "", text)

            answer_parts = []
            for sib in tag.find_next_siblings():
                if sib.name in ["h1", "h2"]:
                    break
                if sib.name in ["p", "ul", "ol", "li"]:
                    answer_parts.append(
                        sib.get_text(" ", strip=True)
                    )

            data.append({
                "questions": question_text,
                "answers": " ".join(answer_parts) or None,
                "topics": current_topic,
                "difficulty_level": None,
            })

    return data
