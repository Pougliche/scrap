require 'nokogiri'
require 'open-uri'
require 'pry'

def bring_html(url)                     #Bien penser à toujours remettre (url) ou il faut / cette def va permettre d'aller chercher la page html avec Nokogiri

    return page = Nokogiri::HTML(open(url)) 

end
    
def bitco(url)                  #Def principale du programme

    info=Hash.new               #on crée le hash en début de def

    all_crypto = bring_html(url).xpath("//html/body/div[2]/div[2]/div[1]/div[1]/div[3]/div[2]/table/tbody/tr")          #On récupère la partie de la page qui nous intéresse

    all_crypto.each do |cryptodata|                                 #Une jolie boucle pour aller chercher les données au bon endroit

    coin_name=cryptodata.css('td[class="no-wrap currency-name"]').css('a[class="currency-name-container link-secondary"]').text     #on utilise ici deux fois .css, faculcatif mais évite d'avoir tous les "a" de la page si il n'y en a pas que dans ce tr 

    coin_price=cryptodata.css("td[class='no-wrap text-right']").css('a[class="price"]').text                #On crée une valeur pour les noms, puis une pour les prix, en allant chercher leur classe dans l'inspecteur

    info[coin_name]=coin_price              #On ajoute les données obtenues dans le hash

    end

    return info                 #On oublie pas de return le hash après la fin de la boucle mais avant la fin de la def

end

puts bitco("https://coinmarketcap.com/all/views/all/")              #affiche le programme et va chercher l'url du site







