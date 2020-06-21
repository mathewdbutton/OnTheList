class ListRecordComponent < ViewComponent::Base
  attr_reader :list, :allow_delete
  def initialize(list_record:, allow_delete: false)
    @list = list_record
    @allow_delete = allow_delete
  end
end
