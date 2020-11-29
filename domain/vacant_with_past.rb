# frozen_string_literal: true

# VacantWithPast
class VacantWithPast < Vacant
  attr_reader :past_number

  def initialize(id:, past_number:, context: nil)
    @past_number = past_number
    super(id: id, context: context)
  end

  def increased?
    diff_number > 2
  end

  def became_to_zero?
    number.zero? && past_number.positive?
  end

  def scraping_text
    ScrapingText.new(id: id)
  end

  def display_diff_number
    if diff_number.positive?
      "枠が #{diff_number.abs} 増えました。"
    else
      "枠が #{diff_number.abs} 減りました。"
    end
  end

  private

  def diff_number
    number - past_number
  end
end
