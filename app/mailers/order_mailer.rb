class OrderMailer < ActionMailer::Base
  default from: "postmaster@sandboxc88b1bdd7cf648049b5c49082abc7511.mailgun.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order.new_order.subject
  #
  def new_order(order)
    # @greeting = "Hi there is a new order"
    @order = order

    mail to: "antoinebe35@gmail.com"
  end
end
