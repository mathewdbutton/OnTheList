class ListRecordComponent < ViewComponent::Base
  attr_reader :list
  def initialize(list_record:)
    @list = list_record
  end
end
