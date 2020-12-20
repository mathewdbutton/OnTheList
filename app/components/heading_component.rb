class HeadingComponent < ViewComponent::Base
  attr_reader :text
  def initialize(text:)
    @text = text
  end

  def markup
    text.split(" ").map { |word|
      [
        tag.span(word[0], class: "bg-primary text-white"),
        word[1..-1],
        " "
      ]
    }.flatten
  end
end
