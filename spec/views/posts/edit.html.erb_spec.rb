require 'rails_helper'

feature "When editing a post" do
  scenario "should update it" do
    post = Post.create(title: 'title 1', message: 'message 1')
    
    visit edit_post_path(post)

    fill_in 'Title', with: 'message 5'
    fill_in 'Message', with: 'title 2'

    click_on 'Salvar'

    post.update(title: 'message 5', message: 'title 2')

    expect(page).to have_content('message 5')
    expect(page).to have_content('title 2')
    #TODO
    #atualizar slugfy da url para novo titulo
  end

  scenario "should validate title size" do
    post = Post.create(title: 'title 1', message: 'message 1')
    
    visit edit_post_path(post)

    fill_in 'Title', with: 'I learned so many great business lessons from this book that I can’t even remember them all. Written by Marc Benioff (founder of Salesforce), it’s an excellent primer if you’re launching a company where you’ll be David going up against Goliath, such as a large, slow incumbent.
Marc’s rules for PR, positioning, dealing with competitors and hiring are legendary. I’ve read this book at least 10 times — most recently I spent a weekend in February reading it cover-to-cover as I was putting the plan together to launch my latest company, PeopleSpark.'

    click_on 'Salvar'

    fill_in 'Title', with: 'This title will work this time. It is shorter'

    click_on 'Salvar'
  end
end
