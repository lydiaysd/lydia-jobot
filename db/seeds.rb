require "open-uri"
require "nokogiri"
require 'pry-byebug'

Job.destroy_all
Company.destroy_all


# High School Diploma
# Master of Arts (M.A.)
# Master of Science (M.S.)
# Master of Business Administration (MBA)
# Master of Fine Arts (MFA)
# Bachelor of Arts (B.A.)
# Bachelor of Science (B.S.)
# Bachelor of Fine Arts (BFA)
# Bachelor of Applied Science (BAS)
# Associate of Arts (A.A.)
# Associate of Science (A.S.)
# Associate of Applied Science (AAS)
# Doctor of Philosophy (Ph.D.)
# Juris Doctor (J.D.)
# Doctor of Medicine (M.D.)
# Doctor of Dental Surgery (DDS)

Language.destroy_all

language = Language.create(name: "Chinese")
language = Language.create(name: "Mandarin")
language = Language.create(name: "English")
language = Language.create(name: "Hindi")
language = Language.create(name: "Arabic")
language = Language.create(name: "Portuguese")
language = Language.create(name: "Bengali")
language = Language.create(name: "Russian")
language = Language.create(name: "Japanese")
language = Language.create(name: "Lahnda")
language = Language.create(name: "Italian")
language = Language.create(name: "German")
language = Language.create(name: "Korean")
language = Language.create(name: "French")
language = Language.create(name: "Turkish")


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

# puts "Scraping jobs from indeed.co.uk"
#     url = "https://www.indeed.co.uk/Web-Developer-jobs-in-London"

#   html_doc = Nokogiri::HTML(open(url).read)
#   html_doc.search(".jobsearch-SerpJobCard").each do |element|
#     show_url = element.search(".title a").attribute('href').value
#     full_url = "https://www.indeed.co.uk#{show_url}"
#     html_show = Nokogiri::HTML(open(full_url).read)
#     job = Job.create!(
#       job_title: html_show.search("#vjs-jobtitle").text.strip,
#       location: html_show.search("#vjs-loc").text.strip,
#       date_posted: html_show.search("#date").text.strip,
#       total_compensation: html_show.search("#salary.no-wrap").text.strip,
#     )

#   end

puts "Scraping jobs from reed.co.uk"
  @url = "https://www.reed.co.uk/jobs/web-developer-jobs-in-london"
  @html_doc = Nokogiri::HTML(open(@url).read)
  @html_doc.search(".job-result").each do |element|
    show_url = element.search(".title a").attribute('href').value
    full_url = "https://www.reed.co.uk#{show_url}"
    html_show = Nokogiri::HTML(open(full_url).read)
    logo = html_show.search('.logo-wrap meta').attr('content')&.value
    company_name = html_show.search('.posted span').text.strip.capitalize
    puts "company: #{company_name}, logo: #{logo}"
    if Company.find_by(name: company_name)
      company = Company.find_by(name: company_name)
    else
      company = Company.new(name: company_name)
      company.remote_logo_url = logo.nil? ? "https://images.pexels.com/photos/2150/sky-space-dark-galaxy.jpg?cs=srgb&dl=astronomy-black-wallpaper-constellation-2150.jpg&fm=jpg" : logo
      company.save
    end
    puts company
    job = Job.create!(
      job_title: html_show.search(".col-xs-12 h1").text.strip.gsub( /(\r\n)|(\s)/m, "" ),
      description: html_show.search(".description").text.strip,
      total_compensation: html_show.search(".salary").text.strip.gsub( /(\r\n)|(\s)/m, "" ),
      location: html_show.search('.location span[data-qa="localityLbl"]').text.strip.gsub( /(\r\n)|(\s)/m, "" ),
      employment_type: html_show.search(".time").text.strip.gsub( /(\r\n)|(\s)/m, "" ),
      date_posted: Date.parse(html_show.search('.posted meta').attr('content')&.value),
      company: company
    )

  end
