FactoryGirl.define do
	factory :user do
		#add sequencing emails here, this should fix that admin editing users test
		sequence(:email) { |n| "ticketee#{n}@example.com"}
		#email "ticketee@email.com"
		password "password"
		password_confirmation "password"

		factory :confirmed_user do
			after_create do |user|
				user.confirm!
			end
		end

		factory :admin_user do
			after_create do |user|
			user.confirm!
			user.update_attribute(:admin, true)
		end
end


	end
end
