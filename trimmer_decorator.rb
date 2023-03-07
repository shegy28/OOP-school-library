require_relative './base_decorator'

class TrimmerDecorator < Decorator
  def initialize(nameable)
    super(nameable)
    @nameable = nameable
  end

  def correct_name
    trimmed_name = @nameable.correct_name
    trimmed_name = trimmed_name.slice(0, 10) if trimmed_name.length > 10
    trimmed_name
  end
end
