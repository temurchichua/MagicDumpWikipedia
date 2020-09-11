#!/bin/sh
set -e

LG=$1
WIKI_DUMP_NAME=${LG}wiki-latest-pages-articles.xml.bz2
WIKI_DUMP_DOWNLOAD_URL=https://dumps.wikimedia.org/${LG}wiki/latest/$WIKI_DUMP_NAME

# არჩეული ენის უახლესი დამპის გადმოწერა
echo "ვიწერ უახლეს დამპს $LG-ენისთვის Wikipedia-ს ბაზისგან ლინკზე: $WIKI_DUMP_DOWNLOAD_URL..."
wget -c $WIKI_DUMP_DOWNLOAD_URL
echo "წარმატებით გადმოვწერე უახლესი $LG-ენის დამპი მისამართზე: $WIKI_DUMP_NAME"


WIKI_DUMP_FILE_IN=$WIKI_DUMP_NAME
WIKI_DUMP_FILE_OUT=${WIKI_DUMP_FILE_IN%%.*}.txt


# extract and clean the chosen Wikipedia dump
echo "ვაექსტრაქტებ და ვწმინდავ ფაილს $WIKI_DUMP_FILE_IN > $WIKI_DUMP_FILE_OUT..."
python3 -m wikiextractor.WikiExtractor $WIKI_DUMP_FILE_IN --processes 8 -q -o - \
| sed "/^\s*\$/d" \
| grep -v "^<doc id=" \
| grep -v "</doc>\$" \
> $WIKI_DUMP_FILE_OUT
echo "წარმატებით დავაექსტრაქტე და გავწმინდე ფაილი $WIKI_DUMP_FILE_IN > $WIKI_DUMP_FILE_OUT"

echo "ვიწყებ ტექსტის პრე-პროცესინგს"

python3 preprocess_wiki_dump.py $WIKI_DUMP_FILE_OUT

echo "პროცესი წარმატებით დასრულდა"