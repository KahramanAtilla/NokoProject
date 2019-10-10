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









PAGE_URL = ""

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com"))

nom_mairie = page.xpath('///a[@class="lientxt"]')

ar = Array.new
nom_mairie.each do |x|
	ar << x.text[5..-1]
end

puts ar

#price = page.xpath()

#po = Array.new
#pohash = {}
#price.each do |x|
#	po << x.text
#end

#	pohash = Hash[ar.zip(po)]
#	coco = pohash.split_into(2398)

#
# puts coco
