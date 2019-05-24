require "open-uri"
require "nokogiri"

class JobsController < ApplicationController
  def index
    url = "https://www.indeed.co.uk/jobs?q=web+developer&l=London"
    @html_doc = Nokogiri::HTML(open(url).read)
    @jobs = @html_doc.search(".jobsearch-SerpJobCard").sort_by do |el|
      date = el.search(".date").text.strip
      if date.blank?
        5000000000000
      else
        data = date.match(/(\d+)\s(\S+)/)
        data[1].to_i.send(data[2]).to_i
      end
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end
end

# scrape with no API

#   fetch(`https://maps.googleapis.com/maps/api/geocode/json?address=${input.value}`)
#   .then(response => response.json())
#   .then((data) => {
