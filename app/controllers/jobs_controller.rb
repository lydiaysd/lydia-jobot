require 'nokogiri'
require 'open-uri'
class JobsController < ApplicationController
  def index
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
end
