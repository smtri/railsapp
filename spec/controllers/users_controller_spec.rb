require 'rails_helper'

describe UsersController do
  
  describe "show action" do

    it "renders show template if user images are found" do
      user = create(:user)
      get :show, { id: user.id }
      response.should render_template('show')
    end

    it 'renders 404 page if user was not found' do
      get :show, id: 0
      response.status.should == 404
    end

  end

  describe "create action" do
    
    xit "redirects to user if user is created" do
      post :create, user: { name: 'user name', email: "email111@email.co", password: "qqqqqqq" }
      response.should redirect_to(user_path(assigns(:user)))
    end

    it "shows error if user is not created and renders new" do
      expect {
        post :create, user: { name: 'user name', email: "email111@email.co"}
        }.to raise_error
    end

  end

  describe "update action" do

    xit 'saves changes to user' do
    end

    xit 'shows error if update was unsuccessful and renders edit page' do
    end

  end

  describe "destroy action" do 

    xit "deletes user" do
    end

    xit "shows error if user is not created and renders new" do
    end

  end

end