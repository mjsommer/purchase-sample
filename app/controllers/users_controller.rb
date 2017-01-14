class UsersController < ApplicationController
  def create
    begin
      User.create(name: params[:name], email: params[:email])

      status = 201 #Created
    rescue
      status = 409 #Conflict
    end

    render :nothing => true, :status => status
  end
end
