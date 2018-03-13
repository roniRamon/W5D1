require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "render user new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it "successfully create a user" do
        post :create, params: { user: {username: 'Tony',password: 'password' } }
        expect(response).to redirect_to(user_url(User.last))

      end
    end

    context 'with Invalid params' do
      it 'flash errors and return user the user new page ' do
        post :create, params: { user: {username: 'Tony' } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end

  end


end
