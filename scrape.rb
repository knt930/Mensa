require 'nokogiri'
require 'open-uri'
require 'csv'

url = "https://mensa.jp/exam/"

charset = nil

html = open(url) do |f|
    charset = f.charset
    f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
doc.xpath('//li[@class="link"]').each do |node|
    p node.css('img').first.attributes["alt"].value
end