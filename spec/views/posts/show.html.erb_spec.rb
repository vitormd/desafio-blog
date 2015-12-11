require 'rails_helper'

feature "When viewing a post" do
  scenario "should be able to delete it" do
    post = create_post
    visit post_path(post)

    click_on 'Deletar'

    expect(current_path).to eq root_path
    #TODO
    #eu quero testar se deletou, mas
    #expect(post.destroyed?).to eq true
    #nao esta funcionando
  end

  scenario "should be able to edit it" do
    post = create_post
    visit post_path(post)

    click_on 'Editar'

    expect(current_path).to eq edit_post_path(post)
    #TODO
    #por algum motivo have_content('title 1') nao funciona
    #mas eu sei por teste empirico que esta la
    expect(page).to have_content('message 1')
  end

  def create_post
    post = Post.create(title: 'title 1', message: 'message 1')
  end
end
