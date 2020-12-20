class HeadingComponent < ViewComponent::Base
  attr_reader :text
  def initialize(text:)
    @text = text
  end

  def markup
    text.split(" ").map { |word|
      [
        {text: word[0], highlight: true},
        {text: word[1..-1], highlight: false},
        {text: " ", highlight: false}
      ]
    }.flatten
  end
end
