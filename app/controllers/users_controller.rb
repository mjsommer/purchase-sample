class UsersController < ApplicationController
  def create
    begin
      @user = User.create(name: params[:name], email: params[:email])
      UserMailer.welcome_email(@user).deliver_later

      status = 201 #Created
    rescue
      status = 409 #Conflict
    end

    render :nothing => true, :status => status
  end
end
