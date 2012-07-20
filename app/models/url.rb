class Url < ActiveRecord::Base
    attr_accessible :long_url, :short_url
    validates_presence_of :long_url
    before_save :add_http
    
    def add_http
        self.long_url = ("http://" + self.long_url) unless self.long_url =~ /^http/i
        self.short_url = randomize
    end
    
    
    def randomize
        chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
        (1..8).collect{|a| chars[rand(chars.size)] }.join
    end
    
end
