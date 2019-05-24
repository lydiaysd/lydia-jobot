require 'nokogiri'
require 'open-uri'
class JobsController < ApplicationController
  def index
    @url = "https://www.reed.co.uk/jobs/ruby-jobs-in-london"
    @html_doc = Nokogiri::HTML(open(@url).read)
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
