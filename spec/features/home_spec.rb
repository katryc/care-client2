require 'rails_helper'
 feature "check the landing page" do
   scenario "the text desplayed on the landing page" do
     visit root_path
     expect(page).to have_text("This is the landing page")

   end

 end
