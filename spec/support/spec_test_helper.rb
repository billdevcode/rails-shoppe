require 'rails_helper'

module SpecTestHelper

  def login
    user = FactoryGirl.create(:user)
    session[:user_id] = user.id
  end

end
