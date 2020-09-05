require "dry/monads"
require "dry/monads/do"
Dry::Schema.load_extensions(:monads)
Dry::Validation.load_extensions(:monads)

class CreateListItem
  include Dry::Monads[:result]
  include Dry::Monads::Do.for(:call)

  def call(params)
    ApplicationRecord.transaction do
      values = yield validate(params)
      item = yield fetch_or_create_item(values[:item_attributes])
      list_item = yield create_list_item(item, values[:quantity], values[:list_id])

      Success([list_item])
    end
  end

  private

  def validate(params)
    Dry::Schema.Params {
      optional(:quantity).maybe(:string)
      required(:item_attributes).hash do
        optional(:id).filled(:integer)
        required(:name).filled(:string)
      end
      required(:list_id).filled(:integer)
    }.call(params).to_monad
  end

  def fetch_or_create_item(item_attributes)
    item = Item.find_or_initialize_by(item_attributes)

    Success(item)
  end

  def create_list_item(item, quantity, list_id)
    contract = NewListItemContract.new.call(item: item, quantity: quantity, list_id: list_id)
    if contract.success?
      Success(ListItem.create!(contract.to_h))
    else
      contract.to_monad
    end
  end
end
