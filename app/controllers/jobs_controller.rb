require "open-uri"
require "nokogiri"

class JobsController < ApplicationController
  def index
    @jobs = Job.all
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
