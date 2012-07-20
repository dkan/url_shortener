class Url < ActiveRecord::Base
    attr_accessible :long_url, :short_url, :count
    validates_presence_of :long_url
    validates :short_url, presence: true, uniqueness: true
    before_save :add_http
    
    def add_http
        self.long_url = ("http://" + self.long_url) unless self.long_url =~ /^http/i
        self.count ||= 0
    end
    
end
