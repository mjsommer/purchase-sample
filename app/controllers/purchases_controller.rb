class PurchasesController < ApplicationController
  def create
    begin
      Purchase.create(user_id: params[:user_id], purchased_at: params[:purchased_at], status: params[:status])

      status = 201 #Created
    rescue
      status = 409 #Conflict
    end

    render :nothing => true, :status => status
  end

  def show
    recent_purchases = Purchase.includes(:user).where("purchases.created_at > ?", Date.today - 7)

    case params[:limit]
      when "name"
        render :json => recent_purchases, :include => {:user => {:only => [:id, :name]}}, :only => [:id]

      when "email"
        render :json => recent_purchases, :include => {:user => {:only => [:id, :email]}}, :only => [:id]

      else
        render :json => recent_purchases, :include => :user
    end
  end
end
