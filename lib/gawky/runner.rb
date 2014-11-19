module Gawky
  class Runner

    def initialize
      @date_now = Date.today
    end
    def run
      @stats = []
      repos = Gawky.github.repos.list org: Gawky.organization, per_page: 100
      repos.each do |repo|

        if ARGV[1] == "stats"
           @stats << {:name => repo.name, :watchers => repo.watchers, :forks => repo.forks}
        elsif repo.open_issues_count > 0
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
      puts @stats.sort_by {|s| s[:forks]}
    end
    private

    def elapsed_time(date)
      (@date_now - date).to_i
    end
  end
end
