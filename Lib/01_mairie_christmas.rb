require 'nokogiri'
require 'open-uri'
require 'pry'

def bring_html(url)                                     #Une def pour aller chercher le xpath grâce à nokogiri

        return page = Nokogiri::HTML(open(url))             #On oublie pas le return devant

end

def get_townhall_urls(url)                              #Une def pour aller chercher les url de chaque ville et les mettre dans un array, pour utiliser dans la seconde def

        all_town = bring_html(url).xpath('//a[@class="lientxt"]')

        town_array = Array.new                              #On crée un array que l'on nomme intelligemment

        all_town.each do |townlisturl|                      #Comme au précédent, on fait une boucle pour récupérer les données du xpath

        town_link = townlisturl["href"]                     #On récupère tous les href des liens grâce à la boucle. 

        town_link = "http://annuaire-des-mairies.com#{town_link[1,town_link.length]}"       #Catastrophe! Le href ne nous donne qu'une partie du lien. On ajoute donc la partie manquante, mais le href commence par un point et bloque la cohésion sociale. pour lier les deux parties, on utilise #{} car nos données sont une variable ; à l'intérieur on utilise 1.town_link.length pour commencer le lien au second caractère. (premier = 0)

        town_array << town_link                             #On ajoute tout ça dans notre array fraichement cueilli

        end

        return town_array                                   #On oublie pas le return en dehors de la boucle, notre array est tout prêt !

end

def get_townhall_email(url)                             #La def pour aller chercher les noms & adresses mail des mairies

        result_array=Array.new                          #On crée un array qu'on organise en colonne avec les noms de ville et les mails
        town_name=""
	all_mail=""


        get_townhall_urls(url).each do |url_list|           #Fais une boucle dans la première méthode pour aller chercher dans toutes les URL 
        result_hash=Hash.new                                #On crée le Hash
        page = Nokogiri::HTML(open(url_list))               #On utilise la méthode open sur l'url list pour incrémenter une variable page (et aller cliquer sur les url que nous fournit la première def)

        all_mail = page.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text 
        town_name = page.xpath('//html/body/div/main/section[1]/div/div/div/h1').text         #Pour récupérer les noms de ville & les mails, on utilise ensuite "page" avec le xpath correspondant
        result_hash[town_name]=all_mail                     #On ajoute les valeurs récupérées dans le hash
                                
        result_array<<result_hash                           #Puis dans le array
end

        return result_array                                 #Pfiou, finally !

end

puts get_townhall_email("http://annuaire-des-mairies.com/val-d-oise.html")                  #On oublie pas ce fils de puts à la fin sinon rien ne s'affiche et on pleure des larmes de sang
