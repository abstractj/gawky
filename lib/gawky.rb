require 'gawky/version'
require 'github_api'
require 'term/ansicolor'
require 'json'


module Gawky

  class Runner

    configuration = JSON.load(IO.read(ENV['HOME'] + '/.gawky.json'))
    @@github = Github.new oauth_token: configuration['token']
    @@date_now = Date.today
    @@acceptable = configuration['maxElapsedDays']

    def run
      issues = @@github.issues.list(:org => ARGV[0], :filter => 'all', :auto_pagination => true, :sort => 'created')
      issues.each do |issue|
        if issue["pull_request"]
          date = DateTime.parse(issue.created_at)
          days_passed = (@@date_now - date).to_i
          if days_passed > @@acceptable
            puts "\e[31m#{date.strftime('%e %b %Y %H:%M %p')}\e[0m  - \e[34m#{issue.user.login}\e[0m - \e[33m#{issue.title}\e[0m - \e[34m#{issue.html_url}\e[0m"
          else
            puts "\e[32m#{date.strftime('%e %b %Y %H:%M %p')}\e[0m  - \e[34m#{issue.user.login}\e[0m - \e[33m#{issue.title}\e[0m - \e[34m#{issue.html_url}\e[0m"
          end
        end
      end
    end
  end
end
