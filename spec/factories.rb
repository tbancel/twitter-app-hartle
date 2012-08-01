FactoryGirl.define do
  factory :user do
    sequence(:name){|n| "Person #{n}"}
    sequence(:email){|n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
    
    factory :admin do
      admin true
    end
    #name "Thomas Bancel"
    #email "bancel.thomas@gmail.com"
    #password "Helloworld"
    #password_confirmation "Helloworld"
  end
  
  factory :micropost do
    content "Lorem Ipsum"
    user
  end
end
