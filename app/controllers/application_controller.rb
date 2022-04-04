class ApplicationController < ActionController::Base
  before_action :ipTracer

  def ipTracer  
    ip_addr = "
    time = ""
    ip_Addr = request.remote_ip
    time = Time.now.getetc

    File.write("ipTracer.txt", "#{ip_addr} - @ #{time}\n")
  end
end
