class Bookmark < ActiveRecord::Base
    belongs_to :topic
    before_validation :httpset
    validates :url, format: { with: /\Ahttp(s?):\/\/.*(com|org|net|gov)/i,
                              message: 'only allows valid URLs.' }

    def httpset
        self.url = 'http://' + url unless url =~ /\Ahttp:\/\/|\Ahttps:\/\//i
    end

    def httpset
        self.url = "http://#{url}" unless url =~ /\Ahttp:\/\/|\Ahttps:\/\//i
    end
end
