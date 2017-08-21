class Module

  def demodulized_name
    self.name.to_s.split('::').last
  end

  alias_method :algorithm_name, :demodulized_name

end
