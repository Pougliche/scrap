require 'nokogiri'
require 'open-uri'
require 'pry'

def bring_html(url)

        return page = Nokogiri::HTML(open(url))

end
    

def bitco(url)

info=Hash.new 

all_crypto = bring_html(url).xpath("//html/body/div[2]/div[2]/div[1]/div[1]/div[3]/div[2]/table/tbody/tr")

all_crypto.each do |cryptodata|

coin_name=cryptodata.css('td[class="no-wrap currency-name"]').css('a[class="currency-name-container link-secondary"]').text

coin_price=cryptodata.css("td[class='no-wrap text-right']").css('a[class="price"]').text

info[coin_name]=coin_price

    end

    return info

end

puts bitco("https://coinmarketcap.com/all/views/all/")







