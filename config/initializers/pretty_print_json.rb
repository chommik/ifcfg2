require "jbuilder"

class Jbuilder
  ##
  # Allows you to set @prettify manually in your .jbuilder files.
  # Example:
  #   json.compact true
  #   json.compact false
  #
  attr_accessor :compact

  alias_method :_original_target, :target!

  ##
  # A shortcut to enabling prettify.
  # Example:
  #   json.compact!
  #
  def compact!
    @compact = true
  end

  def target!
    @compact ? _original_target : ::JSON.pretty_generate(@attributes)
  end
end
