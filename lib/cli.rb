class CLI
    def run
        puts "Welcome to  the News Stories"
        puts "Here are the latest news stories!"
        puts " "
        puts "------------------"
        puts " "
        Scraper.get_articles
        print_stories
        puts " "
        puts "Select an article you would like to see more information on or type 'list' or type 'exit' in order to exit"
        
        menu
        

    end
    
    def menu
        input = gets.strip.downcase
        while input != 'exit' do 
            validNumber = [1, 2, 3, 4, 5]
            if validNumber 
                article = Article.all[input.to_i - 1]
                Scraper.get_article_details(article) if !article.story
                print_story(article)
            elsif "list"
                print_stories
            else 
                puts "I didn't understand your input"
            end
            puts " "
            puts "Would you like to read another article?"
            puts "If so, Select an article you would like to see more information on or type 'list' or type 'exit' in order to exit"
            input = gets.strip.downcase
        end
        puts "Goodbye!"
    end

    def print_story(article)
        puts article.story
    end

    def print_stories
        Article.all.each.with_index(1) do |story, index|
            puts "#{index}. #{story.title}"
        end
    end

end