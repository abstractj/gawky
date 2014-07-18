require 'term/ansicolor'

class Color

  def initialize(date, login, title, url)
    @@date = date
    @@login = login
    @@title = title
    @@url = url
  end
  def warning
    "\e[31m#{@@date.strftime('%e %b %Y %H:%M %p')}\e[0m  - \e[34m#{@@login}\e[0m - \e[33m#{@@title}\e[0m - \e[34m#{@@url}\e[0m"
  end
  def green
    "\e[32m#{@@date.strftime('%e %b %Y %H:%M %p')}\e[0m  - \e[34m#{@@login}\e[0m - \e[33m#{@@title}\e[0m - \e[34m#{@@url}\e[0m"
  end
end
