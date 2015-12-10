require 'rails_helper'

feature "Check home content" do
  scenario "should have post index ordered by date" do
    Post.create(title: 'title 1', message: 'message 1');
    Post.create(title: 'title 2', message: 'message 2');

  	visit root_path

  	expect(page.body).to have_text(/title 2.message 2.*title 1.message 1/)
  end


end