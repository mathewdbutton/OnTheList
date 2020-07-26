class EnvMan
  def self.[](env_var, validate_set = ENV)
    validate_set[env_var].tap do |variable|
      # changing the caller will hopefully stop the stack trace reporting this line
      # and instead the line that acutally cased the error.
      raise StandardError, "The '#{env_var}' environment variable has not been set", caller[2..] if variable.nil?
    end
  end
end
