require "open-uri"
require "nokogiri"

# Job.destroy_all

puts "Scraping jobs from indeed.co.uk"
    url = "https://www.indeed.co.uk/Web-Developer-jobs-in-London"

  html_doc = Nokogiri::HTML(open(url).read)
  html_doc.search(".jobsearch-SerpJobCard").each do |element|
    show_url = element.search(".title a").attribute('href').value
    full_url = "https://www.indeed.co.uk#{show_url}"
    html_show = Nokogiri::HTML(open(full_url).read)
    job = Job.create!(
      role: html_show.search("#vjs-jobtitle").text.strip,
      location: html_show.search("#vjs-loc").text.strip,
      date_posted: html_show.search("#date").text.strip,
      total_compensation: html_show.search("#salary.no-wrap").text.strip,
    )
  end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # def indeed_scraper
  #   @test = "web developer" # params[:search]
  #   # url = "https://www.indeed.co.uk/jobs?q=#{}&l=#{}"
  #     # @jobs = @html_doc.search(".job-type").sort_by do |el| url = "https://www.indeed.co.uk/jobs?q=web+developer&l=London"
  #   @html_doc = Nokogiri::HTML(open(url).read)
  #   # @jobs = @html_doc.search(".jobsearch-SerpJobCard").sort_by do |el|
  #   end

 # def totaljobs_scraper

   # url = "https://www.totaljobs.com/jobs/web-developer/in-london?radius=0&s=header"
   # @html_doc = Nokogiri::HTML(open(url).read)
  # end
  # end
