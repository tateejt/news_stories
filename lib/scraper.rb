class Scraper

    def self.get_articles
        html = open("https://www.medicalnewstoday.com/")
        doc = Nokogiri::HTML(html)
        doc.css("ul.sidebar_feature")[0].css("li.spotlight").each do |topic|
            article = Article.new
            article.title = topic.css(".headline").text.strip
            article.url = topic.css("a").attribute("href").value
        end
            
    end
        
    # Trivial section
    def self.get_article_details(article)
        html = open("https://www.medicalnewstoday.com#{article.url}")
        doc = Nokogiri::HTML(html)
        doc.encoding = 'utf-8'

        if doc.css(".article-body").count > 0 
            
            article.story = doc.css("article.article-body")[0].css("p").text
        else 
            
            article.story = doc.css("div.article_body")[0].css("p").text
        end
        

    end


end
