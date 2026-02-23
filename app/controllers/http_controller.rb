class HttpController < ApplicationController
  def headers
    @headers = safe_http_headers_pretty_cased
  end
end
