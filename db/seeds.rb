require "open-uri"
require "nokogiri"

Job.destroy_all

Skill.destroy_all

skill = Skill.create(name: "Javascript")
skill = Skill.create(name: "Python")
skill = Skill.create(name: "Java")
skill = Skill.create(name: "C++")
skill = Skill.create(name: "Swift")
skill = Skill.create(name: "TypeScript")
skill = Skill.create(name: "Go Programming Language")
skill = Skill.create(name: "SQL")
skill = Skill.create(name: "Ruby on Rails")
skill = Skill.create(name: "R Programming Language")
skill = Skill.create(name: "PHP")
skill = Skill.create(name: "Perl")
skill = Skill.create(name: "Kotlin")
skill = Skill.create(name: "C#")
skill = Skill.create(name: "Rust")
skill = Skill.create(name: "Scheme")
skill = Skill.create(name: "Erlang")
skill = Skill.create(name: "Scala")
skill = Skill.create(name: "Elixir")
skill = Skill.create(name: "Haskell")
skill = Skill.create(name: "HTML")
skill = Skill.create(name: "CSS")
puts "Scraping jobs from indeed.co.uk"
    url = "https://www.indeed.co.uk/Web-Developer-jobs-in-London"

  html_doc = Nokogiri::HTML(open(url).read)
  html_doc.search(".jobsearch-SerpJobCard").first(25).each do |element|
    show_url = element.search(".title a").attribute('href').value
    full_url = "https://www.indeed.co.uk#{show_url}"
    html_show = Nokogiri::HTML(open(full_url).read)
    job = Job.create!(

      job_title: html_show.search(".jobsearch-JobInfoHeader-title").text.strip,
      location: html_show.search(".jobsearch-InlineCompanyRating :nth-child(3)").text.strip,
      date_posted: html_show.search(".jobsearch-JobMetadataFooter").text.split('-').first,     # total_compensation: html_show.search("#salary.no-wrap").text.strip,
      description: html_show.search('.jobsearch-jobDescriptionText').text.strip

    )
  end


puts "Scraping jobs from reed.co.uk"
  @url = "https://www.reed.co.uk/jobs/web-developer-jobs-in-london"
  @html_doc = Nokogiri::HTML(open(@url).read)
  @html_doc.search(".job-result").first(25).each do |element|
    compensation = element.search('.salary').text.strip
    location = element.search('.location').text.split.slice(2)
    date = element.search('.posted-by').text.strip
    show_url = element.search(".title a").attribute('href').value
    full_url = "https://www.reed.co.uk#{show_url}"
    html_show = Nokogiri::HTML(open(full_url).read)
      job = Job.create!(

        job_title: html_show.search(".col-xs-12 h1").text.strip.gsub( /(\r\n)|(\s)/m, " " ),
        description: html_show.search(".description").text.strip.gsub( /(\r\n)|(\s)/m, " " ),
        total_compensation: compensation,
        location: location,
        date_posted: date
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
        job_title: monster_doc.search('.heading :first-child').text.strip.gsub( /(\r\n)|(\s)/m, " " ),
        description: monster_doc.search('.details-content').text.strip.gsub( /(\r\n)|(\s)/m, " " ),
        total_compensation: monster_doc.search('.mux-job-cards').text.split.drop(1).join.gsub( /(\r\n)|(\s)/m, " " ),
        location: monster_doc.search('.value').text.split(',').first,
        date_posted: date
      )
  end

end

