class IpController < ApplicationController
  def ip
    @ip = request.ip

    respond_to do |format|
      format.html
      format.md
      format.json { render json: { ip_address: @ip }}
      format.txt { render plain: @ip }
    end
  end

  def all
    @ip = request.ip
    @dns_status, @dns_result = try_resolve(request.ip)
    respond_to :html, :md, :json, :txt
  end

  def dns
    @dns_status, @dns_result = try_resolve(request.ip)
    respond_to :html, :md, :json, :txt
  end

  private
  def try_resolve(address)
    Resolv::DNS.open do |dns|
      dns.timeouts = 1
      [:ok, dns.getname(address).to_s]
    end
  rescue Resolv::ResolvError => error
    [:error, error.message]
  rescue Resolv::ResolvTimeout
    [:timeout, nil]
  end
end
