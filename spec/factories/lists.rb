FactoryBot.define do
  factory :list do
    name { SecureRandom.hex(16)}
  end
end
