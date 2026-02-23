json.hello "Hello, world"
json.ip_address @ip

json.other_tools do
  json.ip ip_url
  json.ip_all ip_all_url
  json.ip_dns ip_dns_url
  json.http_headers http_headers_url
end

json.ip_in_other_formats do
  [nil, :txt, :json, :md].each do |fmt|
    json.set! fmt || "default", ip_url(format: fmt, only_path: false)
  end
end

json.other_formats do
  [nil, :txt, :json, :md].each do |fmt|
    json.set! fmt || "default", url_for(format: fmt, only_path: false)
  end
end