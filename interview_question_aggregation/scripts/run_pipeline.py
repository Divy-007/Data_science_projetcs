from scrapers.gfg_scraper import scrape_site1
from scrapers.agile_mania_scraper import scrape_site2
from database.insert_questions import insert_questions

# main pipeline function
# runs scrapers for multiple sites and inserts data into DB
# combines results from both scrapers
def main():
    url_site_1 = "https://www.geeksforgeeks.org/data-science/data-science-interview-questions-and-answers/"

    url_site2 = "https://agilemania.com/software-developer-interview-questions"


    data1 = scrape_site1(url_site_1)
    print(f"Site 1 records: {len(data1)}")
    insert_questions(data1)

    data2 = scrape_site2(url_site2)
    print(f"Site 2 records: {len(data2)}")
    insert_questions(data2)



    print(f"Pipeline finished. Records processed: {len(data1) + len(data2)}")


if __name__ == "__main__":
    main()
