require 'open-uri'
require 'nokogiri'

ingredient = 'blueberry'
url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)
puts html_doc.class
html_doc.search('.standard-card-new__article-title').each do |element|
  puts element.text.strip
  puts "https://www.bbcgoodfood.com#{element.attribute('href').value}"
end
