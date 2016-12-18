require 'rails_helper'

describe UsersController do
  
  describe "show action" do

    it "renders show template if user images are found" do
      user = create(:user)
      get :show, { id: user.id }
      response.should render_template('show')
    end

=begin    it 'renders 404 page if user was not found'
      get :show, id: 0
      response.status.should == 404
    end

=end  
  end

end