require 'gawky/version'
require 'gawky/runner'
require 'gawky/status'
require 'github_api'
require 'json'

module Gawky

  @@configuration = JSON.load(IO.read(ENV['HOME'] + '/.gawky.json'))

  if ARGV.empty?
    puts "Please provide the organization name\n  Usage: gawky [organization]"
    exit
  end

  def organization
    ARGV.first
  end
  def self.github
    Github.new oauth_token: @@configuration['token']
  end

  def self.max_elapsed_days
    @@configuration['maxElapsedDays']
  end

end
