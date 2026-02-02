from urllib.request import urlopen
from bs4 import BeautifulSoup
import re
# scraping logic for gfg site
# defining difficulty keywords
DIFFICULTY_KEYWORDS = (
    "beginner",
    "basic",
    "easy",
    "intermediate",
    "medium",
    "advanced",
    "hard",
)

# scraper function
def scrape_site1(url: str):
    """
    Scraper for Site 1:
    - Questions are in <h3> with id starting with a number or 'Q'
    - Topics are in <h2>
    - Answers are in p / ul / ol
    - Difficulty levels are in <h3> containing keywords like 'basic', 'advanced', etc.
    
    """
    html = urlopen(url)
    soup = BeautifulSoup(html, "lxml")

    data = []
    current_topic = None
    current_difficulty = None
# iterating through h2 and h3 tags
    for tag in soup.find_all(["h2", "h3"]):
        
        text = tag.get_text(strip=True)

        if tag.name == "h2":
            current_topic = text
            current_difficulty = None
            continue
        
# indentifing h3 id for question detection

        h3_id = tag.get("id", "").strip()

# handling question extraction question is either starting with number or 'q'
        if h3_id and (h3_id[0].isdigit() or h3_id.lower().startswith("q")):
            question_text = re.sub(r"^\d+\.\s*", "", text)

            answer_parts = []
            for sib in tag.find_next_siblings():
                if sib.name in ["h2", "h3"]:
                    break
                if sib.name in ["p", "ul", "ol"]:
                    answer_parts.append(sib.get_text(" ", strip=True))

            data.append({
                "questions": question_text,
                "answers": " ".join(answer_parts),
                "topics": current_topic,
                "difficulty_level": current_difficulty,
            })
            continue   
# if not a question, check for difficulty level if keywords match
        text_lower = text.lower()
        if any(word in text_lower for word in DIFFICULTY_KEYWORDS):
            current_difficulty = text


    return data
