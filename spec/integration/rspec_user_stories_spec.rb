require 'rails_helper.rb'

feature "User adds a Tip" do
    scenario "User successfully navigates from the General Tips Forum page to the page to add a new Tip on the forum" do
        visit tips_path
        expect(page).to have_content("Listing Tips")
        click_link "Add New Tip"
        expect(page).to have_content("New Tip")
        expect(page).to have_field("Title")
        expect(page).to have_field("Name")
        expect(page).to have_field("Text")
    end
    
    scenario "User successfully navigates from the Home page to the page to add a new Tip on the forum" do
        visit root_path
        click_link "Add Tip"
        expect(page).to have_content("New Tip")
        expect(page).to have_field("Title")
        expect(page).to have_field("Name")
        expect(page).to have_field("Text")
    end
    
    
    scenario "User successfully creates a new tip and posts it to the forum" do
        visit new_tip_path
        expect(page).to have_content("New Tip")
        fill_in "Title", with: "New Capybara Interview Post"
        fill_in "Name", with: "Norm the Niner"
        fill_in "Text", with: "This is a new Capybara Tip"
        click_button "Create Tip"
        expect(page).to have_content("New Capybara Interview Post")
        expect(page).to have_content("Norm the Niner")
        expect(page).to have_content("This is a new Capybara Tip")
    end
end

feature "User comments on a posted Tip" do
    
    scenario "After a User successfully creates a new tip and posts it to the forum, the user would like to post a comment under the tip" do
        visit new_tip_path
        expect(page).to have_content("New Tip")
        fill_in "Title", with: "New Capybara Interview Post 2"
        fill_in "Name", with: "Norm the Niner"
        fill_in "Text", with: "This is a new Capybara Tip 2"
        click_button "Create Tip"
        expect(page).to have_content("New Capybara Interview Post 2")
        expect(page).to have_content("Norm the Niner")
        expect(page).to have_content("This is a new Capybara Tip 2")
        
        expect(page).to have_content("Add a comment")
        expect(page).to have_field("Commenter")
        expect(page).to have_field("Body")
        fill_in "Commenter", with: "Norm the Finer Niner"
        fill_in "Body", with: "This is a Capybara response comment to Tip 2"
        click_button "Create Comment"
        
        expect(page).to have_content("New Capybara Interview Post 2")
        expect(page).to have_content("Norm the Niner")
        expect(page).to have_content("This is a new Capybara Tip 2")
        expect(page).to have_content("Norm the Finer Niner")
        expect(page).to have_content("This is a Capybara response comment to Tip 2")
        
    end
end


feature "User edits an existing tip" do
    
    scenario "The user first creates a tip and posts it to the forum, then decides that he/she wants to EDIT/UPDATE the original post" do
        visit new_tip_path
        expect(page).to have_content("New Tip")
        fill_in "Title", with: "New Capybara Interview Post 3"
        fill_in "Name", with: "Norm the Niner"
        fill_in "Text", with: "This is a new Capybara Tip 3"
        click_button "Create Tip"
        expect(page).to have_content("New Capybara Interview Post 3")
        expect(page).to have_content("Norm the Niner")
        expect(page).to have_content("This is a new Capybara Tip 3")
        
        expect(page).to have_content("Add a comment")
        expect(page).to have_field("Commenter")
        expect(page).to have_field("Body")
        fill_in "Commenter", with: "Norm the Niner"
        fill_in "Body", with: "This is a Capybara response comment to Tip 3"
        click_button "Create Comment"
        
        expect(page).to have_content("New Capybara Interview Post 3")
        expect(page).to have_content("Norm the Niner")
        expect(page).to have_content("This is a new Capybara Tip 3")
        expect(page).to have_content("This is a Capybara response comment to Tip 3")
        
        #Edits the post now
        
        visit tips_path
        expect(page).to have_content("Listing Tips")
        click_link "Edit"
        fill_in "Title", with: "EDIT --> New Capybara Interview Post 3"
        fill_in "Name", with: "EDIT --> Norm the Niner"
        fill_in "Text", with: "EDIT --> This is a new Capybara Tip 3"
        click_button "Update Tip"
        expect(page).to have_content("EDIT --> New Capybara Interview Post 3")
        expect(page).to have_content("EDIT --> Norm the Niner")
        expect(page).to have_content("EDIT --> This is a new Capybara Tip 3")
        expect(page).to have_content("This is a Capybara response comment to Tip 3")
    end
end

feature "User deletes an existing tip" do
    
    scenario "The user first creates a tip and posts it to the forum, then decides that he/she wants to DELETE/DESTROY the original post" do
        visit new_tip_path
        expect(page).to have_content("New Tip")
        fill_in "Title", with: "New Capybara Interview Post 4"
        fill_in "Name", with: "Norm the Niner"
        fill_in "Text", with: "This is a new Capybara Tip 4"
        click_button "Create Tip"
        expect(page).to have_content("New Capybara Interview Post 4")
        expect(page).to have_content("Norm the Niner")
        expect(page).to have_content("This is a new Capybara Tip 4")
        
        expect(page).to have_content("Add a comment")
        expect(page).to have_field("Commenter")
        expect(page).to have_field("Body")
        fill_in "Commenter", with: "Norm the Niner"
        fill_in "Body", with: "This is a Capybara response comment to Tip 4"
        click_button "Create Comment"
        
        expect(page).to have_content("New Capybara Interview Post 4")
        expect(page).to have_content("Norm the Niner")
        expect(page).to have_content("This is a new Capybara Tip 4")
        expect(page).to have_content("This is a Capybara response comment to Tip 4")
        
        #Deletes the post now
        
        visit tips_path
        expect(page).to have_content("Listing Tips")
        click_link "Destroy"
        expect(page).to have_no_content("New Capybara Interview Post 4")
        expect(page).to have_no_content("Norm the Niner")
        expect(page).to have_no_content("This is a new Capybara Tip 4")

    end
end

feature "User deletes his/her comment on a posted Tip" do
    
    scenario "The user would like to remove a comment under a posted tip" do
        visit new_tip_path
        expect(page).to have_content("New Tip")
        fill_in "Title", with: "New Capybara Interview Post 5"
        fill_in "Name", with: "Norm the Niner"
        fill_in "Text", with: "This is a new Capybara Tip 5"
        click_button "Create Tip"
        expect(page).to have_content("New Capybara Interview Post 5")
        expect(page).to have_content("Norm the Niner")
        expect(page).to have_content("This is a new Capybara Tip 5")
        
        expect(page).to have_content("Add a comment")
        expect(page).to have_field("Commenter")
        expect(page).to have_field("Body")
        fill_in "Commenter", with: "Norm the Finer Niner"
        fill_in "Body", with: "This is a Capybara response comment to Tip 5"
        click_button "Create Comment"
        
        expect(page).to have_content("New Capybara Interview Post 5")
        expect(page).to have_content("Norm the Niner")
        expect(page).to have_content("This is a new Capybara Tip 5")
        expect(page).to have_content("Norm the Finer Niner")
        expect(page).to have_content("This is a Capybara response comment to Tip 5")
        
        #User Deletes the comment
        
        click_link "Destroy Comment"
        expect(page).to have_no_content("Norm the Finer Niner")
        expect(page).to have_no_content("This is a Capybara response comment to Tip 5")
        
        
    end
end