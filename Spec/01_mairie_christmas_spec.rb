require_relative '../lib/01_mairie_christmas'

describe "get an url from any website" do
    it "should return nil if the method works right" do
    expect(bring_html("https://www.google.fr")).not_to be_nil 

    end
end 

describe "get two cities and emails from the list" do
    it "should return Taverny and its email" do
        expect(get_townhall_email("http://annuaire-des-mairies.com/val-d-oise.html")).to include("TAVERNY - 95150" => "mairie@ville-taverny.fr")

    end
end