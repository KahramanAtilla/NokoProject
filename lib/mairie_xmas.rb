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

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

nom_mairie = page.xpath('///a[@class="lientxt"]')

ar = Array.new
nom_mairie.each do |x|
	ar << x.text
end


toto = Array.new
	i = 0
	while i < ar.size
	mam = ar[i].downcase.tr(" ", "-")
	page = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/95/#{mam}.html"))

	if i == 0
		puts "picking all emails: please wait"
		puts "..."
	end
	if i == 50
		puts "50/185 email recuperated"
		puts "..."
	end
	if i == 100
		puts "100/185 email recuperated"
		puts "..."
	end
	if i == 150
		puts "150/180 email recuperated"
		puts "..."
	end

	email_marie = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
	toto << email_marie.text
	i = i + 1
	end

hashoux = {}

coco = Array.new

	hashoux = Hash[ar.zip(toto)]
	coco = hashoux.split_into(185)

puts coco
puts coco.size
