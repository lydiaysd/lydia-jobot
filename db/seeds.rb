require 'nokogiri'
require 'open-uri'

# Job.destroy_all

# puts "Scraping jobs from reed.co.uk"
#   @url = "https://www.reed.co.uk/jobs/web-developer-jobs-in-london"
#   @html_doc = Nokogiri::HTML(open(@url).read)
#   @html_doc.search(".job-result").each do |element|
#     show_url = element.search(".title a").attribute('href').value
#     full_url = "https://www.reed.co.uk#{show_url}"
#     html_show = Nokogiri::HTML(open(full_url).read)
#       job = Job.create!(
#         job_role: html_show.search(".col-xs-12 h1").text.strip.gsub( /(\r\n)|(\s)/m, "" ),
#         # description: html_show.search(".description").text.strip.gsub( /(\r\n)|(\s)/m, "" ),
#         total_compensation: html_show.search(".salary").text.strip.gsub( /(\r\n)|(\s)/m, "" ),
#         location: html_show.search(".location").text.strip.gsub( /(\r\n)|(\s)/m, "" ),
#         date_posted: html_show.search(".time").text.strip.gsub( /(\r\n)|(\s)/m, "" )
#       )
#       job.save!
#   end

puts "Scraping monster jobs!"

@url_monster = "https://www.monster.co.uk/jobs/search/?q=web-developer&where=london&cy=uk&client=power"
@html_monster = Nokogiri::HTML(open(@url_monster).read)
@html_monster.search('.card-content').first(3).each do |element|

  var = monster_url = element.search('.title a').attribute('href')
  unless var.nil?
    monster_url = element.search('.title a').attribute('href').value
    monster_doc = Nokogiri::HTML(open(monster_url).read)
      # p job = Job.create!(
        p monster_doc.search('.title').text.strip.gsub( /(\r\n)|(\s)/m, " " )
      # )
  end

end
