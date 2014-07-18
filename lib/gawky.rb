require 'gawky/version'
require 'github_api'
require 'color'
require 'json'


module Gawky

  class Runner

    configuration = JSON.load(IO.read(ENV['HOME'] + '/.gawky.json'))
    @@date_now = Date.today
    @@github = Github.new oauth_token: configuration['token']
    @@acceptable = configuration['maxElapsedDays']

    def run
      issues = @@github.issues.list(:org => ARGV[0], :filter => 'all', :auto_pagination => true, :sort => 'created')
      issues.each do |issue|
        if issue["pull_request"]
          date = DateTime.parse(issue.created_at)
          days_passed = (@@date_now - date).to_i
          if days_passed > @@acceptable
            puts Color.new(date, issue.user.login, issue.title, issue.html_url).warning
          else
            puts Color.new(date, issue.user.login, issue.title, issue.html_url).green
          end
        end
      end
    end
  end
end
