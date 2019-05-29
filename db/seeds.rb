require 'nokogiri'
require 'open-uri'

Job.destroy_all

puts "Scraping jobs from reed.co.uk"
  @url = "https://www.reed.co.uk/jobs/web-developer-jobs-in-london"
  @html_doc = Nokogiri::HTML(open(@url).read)
  @html_doc.search(".job-result").first(25).each do |element|
    show_url = element.search(".title a").attribute('href').value
    full_url = "https://www.reed.co.uk#{show_url}"
    html_show = Nokogiri::HTML(open(full_url).read)
      job = Job.create!(
        job_title: html_show.search(".col-xs-12 h1").text.strip.gsub( /(\r\n)|(\s)/m, "" ),
        description: html_show.search(".description").text.strip.gsub( /(\r\n)|(\s)/m, "" ),
        total_compensation: html_show.search(".salary").text.strip.gsub( /(\r\n)|(\s)/m, "" ),
        location: html_show.search(".location").text.strip.gsub( /(\r\n)|(\s)/m, "" ),
        date_posted: html_show.search(".time").text.strip.gsub( /(\r\n)|(\s)/m, "" )
      )
  end

puts "Scraping monster jobs!"

@url_monster = "https://www.monster.co.uk/jobs/search/?q=web-developer&where=london&cy=uk&client=power"
@html_monster = Nokogiri::HTML(open(@url_monster).read)
@html_monster.search('.card-content').first(25).each do |element|
  date = element.search('.meta :first-child').text


    monster_url = element.search('.title a').attribute('href')

  # begin
  # rescue URI::InvalidURIError => e
  #   puts "Rescued: #{e.inspect}"
  # end

  unless monster_url.nil?
    purl = element.search('.title a').attribute('href').value
    monster_url = URI.parse(URI.encode(purl.strip))

    monster_doc = Nokogiri::HTML(open(monster_url).read)
      job = Job.create!(
        job_title: monster_doc.search('.title').text.strip.gsub( /(\r\n)|(\s)/m, " " ),
        description: monster_doc.search('.details-content').text.strip.gsub( /(\r\n)|(\s)/m, " " ),
        total_compensation: monster_doc.search('.mux-job-cards').text.split.drop(1).join.gsub( /(\r\n)|(\s)/m, " " ),
        location: monster_doc.search('.value').text.split(',').first,
        date_posted: date
      )
  end

end
