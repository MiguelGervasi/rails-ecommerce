class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]

  def index
    @payment_notifications = PaymentNotification.all
  end

  def create
    PaymentNotification.create!(:params => params, :cart_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
    render :nothing => true
  end
end
