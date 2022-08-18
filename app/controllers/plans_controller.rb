class PlansController < ApplicationController
  before_action :set_accounting_options, only: %i(calculate_bill)

  def index
    @plans = Plan.all
  end

  def calculate_bill
    number_of_user = params[:number_of_user]
    charges = if params[:subscripttion_type] == 'yearly'
                @plan.price_yearly
              else
                @plan.price_monthly
              end

    user_limit = @plan.user_limit
    charges += (number_of_user - user_limit) * @plan.additional_user_fee if number_of_user > user_limit

    render json: { calculate_amount: charges }
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end
end
