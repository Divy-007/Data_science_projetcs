from urllib.request import urlopen
from bs4 import BeautifulSoup
import re
#scraping logic for agilemania site

def scrape_site2(url: str):
    """
    Scraper for Site 2:
    - Questions are in <h3> and start with a number
    - Topics are in <h3> but start with A., B., C. etc.
    - Answers are in p / ul / li
    - No difficulty level
    """

    html = urlopen(url)
    soup = BeautifulSoup(html, "lxml")

    data = []
    current_topic = None

    for tag in soup.find_all("h3"):
        text = tag.get_text(strip=True)

        # TOPIC (remove A., B., C. etc. from topic headings)
        
        if not text or not text[0].isdigit():
            cleaned_topic = re.sub(r"^[A-Z]\.\s*", "", text)
            current_topic = cleaned_topic
            continue

    
        # question (starts with a number)
        
        question_text = re.sub(r"^\d+\.\s*", "", text)
# extract answer parts from sibling tags
        answer_parts = []
        for sib in tag.find_next_siblings():
            if sib.name == "h3":
                break
            if sib.name in ["p", "ul", "ol", "li"]:
                answer_parts.append(
                    sib.get_text(" ", strip=True)
                )
# append the record to data list
        data.append({
            "questions": question_text,
            "answers": " ".join(answer_parts) or None,
            "topics": current_topic,
            "difficulty_level": "basic",
        })

    return data
