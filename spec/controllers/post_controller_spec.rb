require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe '#index' do
    context 'renders index page successfully' do
      before { get :index }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response).to render_template(:index) }
    end
  end
  describe '#new' do
    context 'renders new page successfully' do
      before { get :new }

      it { expect(response).to have_http_status(:ok) }
    end
  end

  describe '#destroy' do
    let!(:user) { User.create( first_name:"Hello", last_name: "worlllllllllddddddd", email: "ib@gmail.com", password: "12345", reenter_password: "12345", user_name:"ib12345") }
    let!(:post) { user.posts.create( title: "Hello", content: "worlllllllllddddddd", published: 'true') }
    it 'redirect to root path' do
      delete :destroy, params: { id: post.id }
      expect(response).to redirect_to root_path
    end
  end
end