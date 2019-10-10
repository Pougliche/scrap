require 'nokogiri'
require 'open-uri'
require 'pry'

def bring_html(url)   #Bien penser à toujours remettre (url) à toutes les occurences 

        return page = Nokogiri::HTML(open(url))

end
    
def bitco(url)

info=Hash.new 

all_crypto = bring_html(url).xpath("//html/body/div[2]/div[2]/div[1]/div[1]/div[3]/div[2]/table/tbody/tr")

all_crypto.each do |cryptodata|

coin_name=cryptodata.css('td[class="no-wrap currency-name"]').css('a[class="currency-name-container link-secondary"]').text     #on utilise ici deux fois .css, faculcatif mais évite d'avoir tous les "a" de la page, juste les "a" de ce "tr". 

coin_price=cryptodata.css("td[class='no-wrap text-right']").css('a[class="price"]').text

info[coin_name]=coin_price

    end

    return info         #On oublie pas de return le hash après la fin de la boucle mais avant la fin du def

end

puts bitco("https://coinmarketcap.com/all/views/all/")







