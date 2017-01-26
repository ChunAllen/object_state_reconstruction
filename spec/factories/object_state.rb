FactoryGirl.define do
  factory :object_state do
    object_type 'Object A'
    timestamp 412351252

    trait :invalid do
      object_type nil
    end
  end
end
