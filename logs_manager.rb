require "net/ftp"
require "date"

class LogsManager
  
  def initialize(file_name, url, user, pass, dir)
    @f = file_name
    @ftp = Net::FTP.open(url)
    @ftp.login(user, pass)
    @ftp.chdir(dir)
  end

  def archive
    @ftp.rename("#{@f}.log", "#{@f}-#{(Date.today - 1).to_s}-#{(Date.today).to_s}.log")
    @ftp.close
  end

end

logs = LogsManager.new("filename", "host", "user", "pass", "directory")
logs.archive