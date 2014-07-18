require 'term/ansicolor'

class Status

  def initialize(date, issue)
    @@date = date.strftime('%e %b %Y %H:%M %p')
    @@login = issue.user.login
    @@title = issue.title
    @@url = issue.html_url
  end

  def warning
    "\e[31m#{@@date}\e[0m  - \e[34m#{@@login}\e[0m - \e[33m#{@@title}\e[0m - \e[34m#{@@url}\e[0m"
  end

  def green
    "\e[32m#{@@date}\e[0m  - \e[34m#{@@login}\e[0m - \e[33m#{@@title}\e[0m - \e[34m#{@@url}\e[0m"
  end
end
