class Article
    attr_accessor :title, :url, :story
    @@all = []

    def initialize 
        @@all << self
    end

    def self.all
        @@all
    end
    

end
