class InfoController < ApplicationController
  def all
    @ip = request.ip
  end
end
