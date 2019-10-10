require 'rubygems'
require 'nokogiri'
require 'open-uri'
















Hash.class_eval do
  def split_into(divisions)
    count = 0
    inject([]) do |final, key_value|
      final[count%divisions] ||= {}
      final[count%divisions].merge!({key_value[0] => key_value[1]})
      count += 1
      final
    end
  end
end









PAGE_URL = "https://coinmarketcap.com/all/views/all/"

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

symb = page.xpath('///*[@id]/td[3]')

puts "Starting to fil the array of symb"
puts "..."

ar = Array.new
symb.each do |x|
	ar << x.text
end

puts "Array of symb done"

price = page.xpath('///tbody/tr/td[@class = "no-wrap text-right"]/a[@class = "price"]')

puts "Starting to fil the prices array"
puts "..."
po = Array.new
pohash = {}
price.each do |x|
	po << x.text[1..-1]
end
puts "Array of prices done"
puts "..."

puts "Zipping the array, spliting the hash"

	pohash = Hash[ar.zip(po)]
	coco = pohash.split_into(2398)

puts coco

puts "Et voila ;)"
