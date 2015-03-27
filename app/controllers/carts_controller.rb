class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end

  def payment
	@amount = current_order.subtotal
	@amount = @amount * 100
	@amount = @amount.round

	customer = Stripe::Customer.create(
	:email => params[:stripeEmail],
	:card  => params[:stripeToken]
	)

	charge = Stripe::Charge.create(
	:customer    => customer.id,
	:amount      => @amount,
	:description => 'Order',
	:currency    => 'usd'
	)

#custom code here
	if charge["paid"] == true
		OrderMailer.new_order(current_order.order_items).deliver
    	redirect_to root_path
	end



	rescue Stripe::CardError => e
	flash[:error] = e.message
	redirect_to charges_path
  end

end
