json.dns do
  if @dns_status == :ok
    json.ptr @dns_result
  elsif @dns_status == :error
    json.response "error"
    json.message @dns_result
  elsif @dns_status == :timeout
    json.response "timeout"
  end
end