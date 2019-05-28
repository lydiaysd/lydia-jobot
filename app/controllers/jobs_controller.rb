require "open-uri"
require "nokogiri"

class JobsController < ApplicationController
  def index
    indeed_scraper
    reed_scraper
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def reed_scraper
    @url = "https://www.reed.co.uk/jobs/web-developer-jobs-in-london"
    @html_doc = Nokogiri::HTML(open(@url).read)
  end

  def indeed_scraper
    # url = "https://www.indeed.co.uk/jobs?q=#{}&l=#{}"
    url = "https://www.indeed.co.uk/jobs?q=web+developer&l=London"
    @html_doc = Nokogiri::HTML(open(url).read)
    @jobs = @html_doc.search(".jobsearch-SerpJobCard").sort_by do |el|
      date = el.search(".date").text.strip.gsub('+', '')
      if date.blank?
        50000000000000
      else
        data = date.match(/(\d+)\s(\S+)/)
        data[1].to_i.send(data[2]).to_i
      end
    end
  end
end

# scrape with no API

#   fetch(`https://maps.googleapis.com/maps/api/geocode/json?address=${input.value}`)
#   .then(response => response.json())
#   .then((data) => {
