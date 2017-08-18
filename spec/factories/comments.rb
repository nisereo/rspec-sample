FactoryGirl.define do
  factory :comment, class: Comment do
    author 'MyString'
    body 'MyText'

    trait :with_article do
      association :article, factory: :article
    end
  end
end
