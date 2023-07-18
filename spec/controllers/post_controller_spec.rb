require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe '#index' do
    context 'renders index page successfully' do
      before { get :index }

      it { expect(response).to have_http_status(:ok) }
    end
  end
end