module Gawky
  class Runner

    def initialize
      @date_now = Date.today
    end

    def run
      @stats = []
      repos = Gawky.github.repos.list org: Gawky.organization, per_page: 100
      repos.each do |repo|

        @stats << {:name => repo.name, :watchers => repo.watchers, :forks => repo.forks}
        if ARGV.length == 1 && repo.open_issues_count > 0
          pulls = Gawky.github.pull_requests.list user: Gawky.organization, repo: repo.name
          pulls.each do |pull|
            date = DateTime.parse(pull.created_at)
            if elapsed_time(date) > Gawky.max_elapsed_days
              puts Status.new(date, pull).warning
            else
              puts Status.new(date, pull).green
            end
          end
        end
      end

      if ARGV[1] == "forks"
        stats = @stats.sort {|a,b| b[:forks] <=> a[:forks]}
        stats.each do |repo|
          puts "Repository: #{repo[:name]} - forks: #{repo[:forks]} - watchers: #{repo[:watchers]}"
        end
      end
      if ARGV[1] == "watchers"
        stats = @stats.sort {|a,b| b[:watchers] <=> a[:watchers]}
        stats.each do |repo|
          puts "Repository: #{repo[:name]} - watchers: #{repo[:watchers]} - forks: #{repo[:forks]}"
        end
      end

    end

    private
    def elapsed_time(date)
      (@date_now - date).to_i
    end
  end
end
