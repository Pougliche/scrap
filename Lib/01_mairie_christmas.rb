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

    town_link = townlisturl["href"]

    town_link = "http://annuaire-des-mairies.com#{town_link[1,town_link.length]}"

        town_array << town_link

    end

return town_array

end

    def get_townhall_email(url)

        finally=Hash.new

    get_townhall_urls(url).each do |url_list|

    page = Nokogiri::HTML(open(url_list))

    all_mail = page.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    town_name = page.xpath('//html/body/div/main/section[1]/div/div/div/h1').text

        finally[town_name]=all_mail

    end

return finally

end

puts get_townhall_email("http://annuaire-des-mairies.com/val-d-oise.html")
