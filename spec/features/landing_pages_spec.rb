require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context 'Going to website' do
    Steps 'Being welcomed' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can see a welcome message' do
        expect(page).to have_content("Welcome to Lease Mileage Calculator!")
      end
      And 'I can see a table of leases' do
        expect(page).to have_content("Initial lease date")
      end
      And 'I see a message telling me to log in to add a lease' do
        expect(page).to have_content("Log in or sign up to add your own!")
      end
    end

    Steps 'Signing up' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can click a button to sign up' do
        click_link('Sign up')
      end
      And 'I am on the sign up page' do
        expect(page).to have_content("Password confirmation")
      end
      Then 'I can fill out the sign up form and click submit' do
        fill_in('Email', :with => 'a@b.com')
        fill_in('Password', :with => '123456')
        fill_in('Password confirmation', :with => '123456')
        click_button('Sign up')
      end
      And 'I receive a confirmation message' do
        expect(page).to have_content("Welcome! You have signed up successfully.")
      end
      Then 'I can log out' do
        click_link("Log out")
      end
      And 'I receive a confirmation message' do
        expect(page).to have_content("Signed out successfully.")
      end
    end

    Steps 'Logging in and out' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'as a registered user I can log in' do
        click_link("Log in")
        fill_in('Email', :with => 'a@b.com')
        fill_in('Password', :with => '123456')
        click_button("Log in")
      end
      # And 'I see a confirmation message with my email' do
      #   expect(page).to have_content("a@b.com Signed in successfully")
      # end
    end
  end
end
