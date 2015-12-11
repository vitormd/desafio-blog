require 'rails_helper'

feature "Check home" do
  scenario "should have post index ordered by date" do 
    create_posts

  	visit root_path

  	expect(page.body).to have_text(/title 2.message 2.*title 1.message 1/)
  end

  scenario "should have a 'Novo Post' link to posts/new" do
  	visit root_path

  	click_on 'Novo Post'

  	expect(current_path).to eq new_post_path
  end

  scenario "should be able to click a post to got to it" do
  	post = create_posts[0]

  	visit root_path

  	click_on 'title 1'

  	expect(current_path).to eq post_path(post)
  end

  def create_posts
    posts = []
    posts << Post.create(title: 'title 1', message: 'message 1')
    posts << Post.create(title: 'title 2', message: 'message 2')
  end
end