require 'nokogiri'
require 'open-uri'
require 'csv'

namespace :mensa do
  desc 'MENSAの募集が始まったらメールを送る'
  task send_email: :environment do
    url = "https://mensa.jp/exam/"

    charset = nil

    html = open(url) do |f|
      charset = f.charset
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)
    doc.xpath('//li[@class="link"]').each do |node|
      text = node.css('img').first.attributes["alt"].value
      if text != '満員'
        MensaMailer.open.deliver_now
      end
    end
  end
end
