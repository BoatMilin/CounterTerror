'''
Rate Limit
curl - -head
https: // api.nytimes.com / svc / books / v3 / lists / overview.json?api - key = < your - api - key > 2 > / dev / null | grep - i
"X-RateLimit"
X - RateLimit - Limit - day: 1000
X - RateLimit - Limit - second: 5
X - RateLimit - Remaining - day: 180
X - RateLimit - Remaining - second: 5
'''
from nytimesarticle import articleAPI  # ref: https://github.com/evansherlock/nytimesarticle
import csv
import time
import logging

logging.basicConfig(format='%(asctime)s | %(levelname)s | %(message)s',
                    level=logging.DEBUG)

NYT_KEY_LIST = ['d0b6e935ac3247ef8391f7f009eaeec6', '387a04a9f71e4ed5a2db9654c5b45845', 'dc6ecddf2bf142c380caf8811e533e5c']
###########################Settings##########################################################################################
KEYWORD_Q = 'ISIL'
START_YEAR = 1980
END_YEAR = 2016

BEGIN_DATE =  START_YEAR * 10000 + 101
END_DATE = END_YEAR * 10000 + 1231
MAX_PAGE_LIMIT = 200
HEADER = ['pub_date', 'keyword_name', 'keyword_value', 'word_count', 'score', 'headline_main']
############################################################################################################################

def test():
    api = articleAPI(NYT_KEY_LIST[0])
    articles_map = api.search(q=KEYWORD_Q,
                              begin_date=BEGIN_DATE,
                              end_date=END_DATE)
    print articles_map


def write_csv_header(output_csv_name):
    CSV_OUTFILE = open(output_csv_name, 'wb')
    writer = csv.writer(CSV_OUTFILE, delimiter=',', quotechar=' ', quoting=csv.QUOTE_MINIMAL)
    writer.writerow(HEADER)
    CSV_OUTFILE.close()


def collect_nyt_to_page_200(output_csv_name):  # maximum total # of articles will be 10 * 200 = 2000 for (1986 - 2017)
    page_index = 0
    data_id = 1
    api_key_index = 0

    write_csv_header(output_csv_name)


    while (page_index < MAX_PAGE_LIMIT):
        try:
            api = articleAPI(NYT_KEY_LIST[api_key_index])
            articles_map = api.search(q=KEYWORD_Q,
                                      # fq={'headline': 'terror', 'source': ['Reuters', 'AP', 'The New York Times']},
                                      begin_date=BEGIN_DATE,
                                      end_date=END_DATE,
                                      page=page_index)
        except:
            logging.warning('error occurred in request ' + `page_index`)
            continue
        if not articles_map:
            logging.warning('articles_map is null')
        if 'status' not in articles_map:  # Reached Rate Limit switching api key
            logging.warning('Reached API limit!')
            api_key_index += 1
            api_key_index %= 3
        else:
            CSV_OUTFILE = open(output_csv_name, 'a')
            writer = csv.writer(CSV_OUTFILE, delimiter=',', quotechar=' ', quoting=csv.QUOTE_MINIMAL)
            doc_length = len(articles_map['response']['docs'])
            logging.info(
                'page_index[' + `page_index` + '][' + `doc_length` + ']:| pub_date | keyword_name | keyword_value | word_count | score(float) | headline_main')

            for doc_index in range(doc_length):
                try:
                    pub_date = articles_map['response']['docs'][doc_index]['pub_date']
                    keywords = articles_map['response']['docs'][doc_index]['keywords']
                    word_count = articles_map['response']['docs'][doc_index]['word_count']
                    score = articles_map['response']['docs'][doc_index]['score']
                    headline = articles_map['response']['docs'][doc_index]['headline']['main'].encode('utf-8')
                except KeyError as e:
                    logging.warning('KeyError ' + `e`)
                    continue
                if keywords:
                    keyword_name = str(keywords[0]['name']).replace(" ", "").encode('utf-8').strip()
                    if str(keyword_name) == 'glocations':
                        keyword_value = str(keywords[0]['value']).replace(" ", "").encode('utf-8').strip()
                        logging.info(`data_id` + ':doc_index[' + `doc_index` + ']:|' + `str(pub_date)` + ' | ' +
                                     str(keyword_name) + ' | ' +
                                     str(keyword_value) + ' | ' +
                                     `word_count` + ' | ' +
                                     `score` + ' | ' +
                                     headline)
                        data_id += 1
                        writer.writerow([str(pub_date) + ',' +
                                         str(keyword_name) + ',' +
                                         str(keyword_value) + ',' +
                                         `word_count` + ',' +
                                         str(score) + ',' + headline])
            page_index += 1
            CSV_OUTFILE.close()
            time.sleep(1)


if __name__ == "__main__":
    collect_nyt_to_page_200(output_csv_name=KEYWORD_Q+'_[' + `START_YEAR` + ' -  ' + `END_YEAR` + '].csv')

