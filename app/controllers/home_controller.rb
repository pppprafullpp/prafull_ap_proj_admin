class HomeController < ApplicationController

  before_filter :authenticate_admin!

  def index
    if !current_admin.has_role? :Admin
      flash[:danger] = "You Are Not the Authentic Admin, Contact Admin to get access"
      reset_session
      redirect_to root_path
    end

  end

end
