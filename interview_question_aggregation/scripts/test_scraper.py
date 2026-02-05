from scrapers.gfg_scraper import scrape_site1

# test script for GeeksforGeeks scraper
url = "https://www.geeksforgeeks.org/data-science/data-science-interview-questions-and-answers/"
data = scrape_site1(url)

print(len(data))
print(data[0])
print(data[0]["questions"])
print(data[-1]["questions"])
