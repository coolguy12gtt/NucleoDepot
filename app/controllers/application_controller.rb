class ApplicationController < ActionController::Base
  before_action :ipTracer

  def ipTracer  
    ip_addr = ""
    time = ""
    ip_addr = request.remote_ip
    time = Time.now.getutc

    File.open("ipTracer.txt", 'a') do |f|
      f << "#{ip_addr} - @ #{time}\n"
    end
  end
end
