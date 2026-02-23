class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  before_action :set_default_format

  protected
  def set_default_format
    return unless params[:format].nil?

    if request.user_agent&.to_s&.downcase&.include? "curl"
      request.format = :md
    end
  end

  def safe_http_headers_pretty_cased
    request
      .headers
      .to_h
      .select { |k, v| k.start_with? "HTTP_" }
      .transform_keys { |k|
        k.delete_prefix("HTTP_").split("_").map(&:capitalize).join("-")
      }
      .excluding(
        "X-Forwarded-For",
        "X-Forwarded-Proto",
        "X-Forwarded-Host",
        "X-Forwarded-Port",
        "X-Real-ip",
        "Forwarded",
        )
  end
end
