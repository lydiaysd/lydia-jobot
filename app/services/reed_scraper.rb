class ReedScraper

  def initialize(job_title, location, date_posted)
    if date_posted
      @url = "https://www.reed.co.uk/jobs/#{job_title.downcase.split.join('-')}-jobs-in-london?keywords=#{job_title.downcase.split.join('-')}&datecreatedoffset=LastTwoWeeks"
    else
      @url = "https://www.reed.co.uk/jobs/#{job_title.downcase.split.join('-')}-jobs-in-london?keywords=#{job_title.downcase.split.join('-')}"
    end
    Job.destroy_all
    @html_doc = Nokogiri::HTML(open(@url).read)
  end

  def scrape
    @html_doc.search(".job-result").first(30).each do |element|
      compensation = element.search('.salary').text.strip
      location = element.search('.location').text.split.slice(2)
      date = element.search('.posted-by').text.strip
      title = element.search('.title').text.strip
      show_url = element.search(".title a").attribute('href').value
      full_url = "https://www.reed.co.uk#{show_url}"
      html_show = Nokogiri::HTML(open(full_url).read)
      logo = html_show.search('.logo-wrap meta').attr('content')&.value
      company_url = html_show.search('.logo-wrap').attr('href')&.value

      # if company_url.match(/company-profile/)
      #   company_show = Nokogiri::HTML(open("https://www.reed.co.uk#{company_url}").read)
      #   company_industry = company_show.search('.information__item')
      #   industry_name = company_industry.find { |e| e.search('.information__title').text.strip == "Sector" }
      #   industry_name = industry_name.search('.information__description').text.strip
      #   if Industry.find_by(name: industry_name)
      #     industry = Industry.find_by(name: industry_name)
      #   else
      #     industry = Industry.new(name: industry_name)
      #     industry.save
      #   end
      # end

      company_name = html_show.search('.posted span').text.strip.capitalize
      "company: #{company_name}, logo: #{logo}"
      company = Company.find_by(name: company_name)
      unless company
        begin
        company = Company.new(name: company_name)
        company.remote_logo_url = logo.nil? ? './app/assets/images/default-robot.png' : logo
        company.save
        rescue => e
          company.remote_logo_url = image_url('default-job.png')
          company.save
        end
      end
      # if CompanyIndustry.where(company: company, industry: industry).empty? && industry
      #   CompanyIndustry.create(company: company, industry: industry)
      # end
      company
      find_salary = html_show.search(".salary span").text.strip

      if find_salary.include?("day")
        if find_salary.include?("-")
          salary = (find_salary.split("-").first).delete('£').to_i * 252
        else
          salary = find_salary.gsub(/\D/, "")
        end
      elsif find_salary.include?("annum")
        if find_salary.include?("-")
          salary = find_salary.split("-").first.gsub(/\D/, "")
        else
          salary = find_salary.gsub(/\D/, "")
        end
      else
        salary = find_salary.first(17)
      end

      job = Job.new(
        job_title: title,
        description: html_show.search(".description").text.strip.squish,
        total_compensation: salary,
        location: html_show.search('.location span[data-qa="localityLbl"]').text.strip.squish,
        employment_type: html_show.search(".time span").first.text.strip.squish,
        date_posted: Date.parse(html_show.search('.posted meta').attr('content')&.value),
        company: company,
        url: full_url
      )
      job.years_experience = (0..5).to_a.sample
      job.visa_sponsor = /visa|sponsorship|sponsor/i.match?(job.description)
      job.save
    end
  end
end
