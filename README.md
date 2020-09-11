# MagicDump - Wikipedia dump file to pre-processed Text
#### Wikipedia-ს dump ფაილიდან ტექსტის მომზადება დასამუშავებლად
[![made-with-python](https://img.shields.io/badge/Made%20with-Python-1f425f.svg)](https://www.python.org/)

ვიკიპედიიდან გადმოწერილი დამპ ფაილი პირდაპირ არ არის მზად NLP დავალებებთან სამუშაოდ (სჭირდება ტექსტის ამოღება თეგებიდან, წინადადებების დაყოფა, ხაზზე განაწილება და ა.შ.) 

არსებული რეპოზიტორიის დახმარებით შეძლებთ dump ფაილის ბოლო ვერსიის გადმოწერის > დაექსტრაქტების > ტექსტის ამოღების > გასუფთავების ეტაპების ავტომატიზაციას

## მოთხოვნები:

პროექტი მორგებულია Python 3-ის სამუშაო გარემოზე. გამართული და შემოწმებულია:
> **Python 3.8.3** (default, Jul  2 2020, 16:21:59) 
> [GCC 7.3.0] :: Anaconda, Inc. on linux


პროექტს გასაშვებად სჭირდება ორი ბიბლიოთეკა:

> - [Microsoft Bling Fire](https://github.com/microsoft/BlingFire)
> - [WikiExtractor](https://github.com/attardi/wikiextractor)

დასაყენებლად ტერმინალში გაუშვით ბრძანება:

```
pip install -r requirements.txt
```

## გაშვების ინსტრუქცია

პროექტის გასაშვებათ თქვენს მოწყობილობაში დაკლონეთ ეს რეპოზიტორია.

მას შემდეგ რაც წინა საფეხურებს გაივლით, მოწყობილობაში გახსნით რეპოზიტორიას და ბიბლიოთეკებს დააყენებთ გაუშვით ტერმინალ ბრძანება:

``` sh magicdump.sh <language>```

```<language>```-ს ნაცვლად ჩაწერეთ იმ ენის ISO 639-1 (two-letter codes) ტეგი, რომელ ენაზე არსებული ვიკიპედიის არქივის დამპის გადმოწერაც გინდათ.
 [ენის ტეგები შეგიძლიათ ნახოთ აქ.](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes)
 
 მაგალითად, ქართული ენისთვის:
 
``` sh magidump.sh ka```

_watch the magic happen ;)_ 

## შედეგი:

საბოლოოდ დაგხვდება რამოდენიმე ფაილი გაშვების დირექტორიიდან:

> - ***wiki-lastest-pages-articles.xml.bz2** - არქივი
> - ***wiki-lastest-pages-articles.txt** - არქივიდან ამოღებული ტექსტი
> - ***wiki-lastest-pages-articles-preprocessed.txt** - ხაზებად გადანაწილებული წინადადებები

### წყაროები:
> 1. [სრული ინსტრუქცია ინგლისურ ენაზე და განხილული კოდის ფრაგმენტები კოდის ავტორისგან](https://towardsdatascience.com/pre-processing-a-wikipedia-dump-for-nlp-model-training-a-write-up-3b9176fdf67)