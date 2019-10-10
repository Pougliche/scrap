require_relative '../lib/00_dark_trader'


describe "get an url from any website" do
    it "should return nil if the method works right" do
    expect(bring_html("https://www.google.fr")).not_to be_nil 

    end
end 


describe "get two currency from the list" do
    it "should return Bitcoin and Ethereum" do
        expect(bitco("https://coinmarketcap.com/all/views/all/")).to include("Bitcoin","Ethereum")

    end
end