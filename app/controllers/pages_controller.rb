class PagesController < ApplicationController
  before_action:authenticate_user!,only:[:users ]
   before_action:authenticate_admin!,only:[:admin,:newquiz]
  def home
  end

  def users
     @categories=Category.all
  end

  def admin
    @categories=Category.all
  end
  
  def newquiz
  end
end
