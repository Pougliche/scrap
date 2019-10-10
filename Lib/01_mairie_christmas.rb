require 'nokogiri'
require 'open-uri'
require 'pry'

def bring_html(url) 

    return page = Nokogiri::HTML(open(url))

end

    def get_townhall_urls(url)

    all_town = bring_html(url).xpath('//a[@class="lientxt"]')

    town_array = Array.new

    all_town.each do |townlisturl|

    town_link = townlisturl["href"]         #on récupère tous les href des liens grâce à la boucle 

    town_link = "http://annuaire-des-mairies.com#{town_link[1,town_link.length]}"       #pour lier les deux parties, on utilise #{} ; à l'intérieur on utilise 1.town_link.length pour commencer le lien au second caractère (le premier est un point)

        town_array << town_link

    end

return town_array

end

    def get_townhall_email(url)

        finally=Hash.new #toujours créer le hash en début de la def 

    get_townhall_urls(url).each do |url_list| #Fais une boucle dans la première méthode pour aller chercher dans toutes les URL 

    page = Nokogiri::HTML(open(url_list)) #on utilise la méthode open sur l'url list pour incrémenter une variable page

    all_mail = page.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text 
    town_name = page.xpath('//html/body/div/main/section[1]/div/div/div/h1').text           #pour récupérer les noms de ville & les mails, on utilise ensuite page avec le xpath correspondant

        finally[town_name]=all_mail #on ajoute les valeurs récupérées dans le hash

    end

return finally              #pfiou, finally !

end

puts get_townhall_email("http://annuaire-des-mairies.com/val-d-oise.html")      #on oublie pas de puts à la fin sinon rien ne s'affiche et on pleure des larmes de sang
