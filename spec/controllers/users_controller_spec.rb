require 'rails_helper'

describe UsersController do

  describe "index" do
    
    xit "shows list of users" do
    end
    
    it "renders index" do
      get :index
      expect(response).to render_template :index
    end

  end
  
  describe "show action" do

    it "renders show" do
      user = create(:user)
      get :show, { id: user.id }
      expect(response).to render_template :show
    end

    it 'renders 404 page if user was not found' do
      get :show, id: 0
      expect(response.status).to eq 404
    end

  end

  describe "create action" do
    
    it "redirects to user if user is created" do
      post :create, user: FactoryGirl.attributes_for(:user)
      expect(response).to redirect_to(user_path(assigns(:user)))
    end

    it "renders new if user is not created" do
      post :create, user: FactoryGirl.attributes_for(:invalid_user)      
      expect(response).to render_template('new')
    end

  end

  describe "update action" do
    before :each do
      @user = create(:user, name: 'Lawrence')
    end

    context "valid attributes" do
      it 'saves changes to user' do
        put :update, id: @user,
        user: FactoryGirl.attributes_for(:user, name: 'Larry')
        @user.reload
        expect(@user.name).to eq 'Larry'
      end

      it 'redirects to the updated user' do 
        put :update, id: @user, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to @user
      end
    end

    context "invalid attributes" do
      
      it "locates the requested user" do
        put :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user)
        expect(assigns(:user)).to eq(@user)
      end

      it 'does not save invalid changes to user' do
        put :update, id: @user,
        user: FactoryGirl.attributes_for(:user, name: nil)
        @user.reload
        expect(@user.name).to eq 'Lawrence'
      end

      it 'redirects to the updated user' do 
        put :update, id: @user, user: FactoryGirl.attributes_for(:invalid_user)
        expect(response).to render_template :edit
      end
    end
  end

  describe "destroy action" do 

    xit "deletes user" do
    end

    xit "shows error if user is not created and renders new" do
    end

  end

end