require 'spec_helper'

admin_user = User.create(:email => "admin@ticketee.com",
												 :password => "password")
admin_user.admin = true
admin_user.confirm!
Project.create(:name => "Ticketee Beta")

feature "Seed Data" do
	scenario "The basics" do
		load Rails.root + "db/seeds.rb"
		user = User.find_by_email!("admin@ticketee.com")
		sign_in_as!(user)
		page.should have_content("Ticketee Beta")
	end
end
