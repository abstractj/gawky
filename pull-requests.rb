require 'github_api'
require 'term/ansicolor'

connection = Github.new oauth_token: 'c2a21e0dbea1d0f3f5d7a1821b63ed55f4d87f38'
date_now = Date.today
acceptable = 7

issues = connection.issues.list(:org => 'aerogear', :filter => 'all', :auto_pagination => true, :sort => 'created')
issues.each do |issue|
  if issue["pull_request"]
    date = DateTime.parse(issue.created_at)
    days_passed = (date_now - date).to_i
    if days_passed > acceptable
      puts "\e[31m#{date.strftime('%e %b %Y %H:%M %p')}\e[0m  - \e[34m#{issue.user.login}\e[0m - \e[33m#{issue.title}\e[0m - \e[34m#{issue.html_url}\e[0m"
    else
      puts "\e[32m#{date.strftime('%e %b %Y %H:%M %p')}\e[0m  - \e[34m#{issue.user.login}\e[0m - \e[33m#{issue.title}\e[0m - \e[34m#{issue.html_url}\e[0m"
    end
  end
end

