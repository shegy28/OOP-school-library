class Nameable
  def self.correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
