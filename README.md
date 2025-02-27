# vanitysizing
My second data project looked into how major U.S and UK brands all have different size charts. 

## Goals
My goal was to show the challenges women face because there is so much size variation in clothing brands. I scraped sizechart.com to find a list of major U.S and UK brands. I multiscraped the pages and found size charts for each of these brands. I had to double check all the brands to ensure sizechart.com was up to date. It was not. So, I had to go to several clothing store's websites and scrape from there using playwright to speed up the process. 

## Challenges, what I learned and data analysis process. 
 1. sizecharts.com was not up to date. This meant having to physically go through over 100 websites to double check if the sizes were accurate or not. I also found that depending on whether you are buying jeans or pants, sizes even within the brand will change. 

 2. Scraping HORRORS. You can see in my collectingdata notebook, but when I did my first scrap, every information per brand did not print out in different columns but instead, all in one cell. It was unorganized and messy. Thanks to stack overflow and video tutorials, I learned I could use the .explode function to take out details from a single value and place them in their respective column.

 4. Size ranges. Some clothing brands listed out sizes as ranges. For example, a size 2 in jeans could be 30-35 inches for waist. This got tricky especially when I was using pandas. So after speaking to my TA and mentor, I decided to make these values floats and find the average of each range. 

## Please note

 I previously relied on a youtube video to make the scrolly feature you see. However, to replace my boring red scrolly feature with a measuring tape, I asked Claude for basic instructions. All data gathering,analysis and plotting was done on my jupyter notebook without AI assistance. 
