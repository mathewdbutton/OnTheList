class NewListItemContract < Dry::Validation::Contract
  params do
    optional(:quantity).maybe(:string)
    required(:item).filled(Types.Instance(Item))
    required(:list_id).filled(:integer)
  end
end
