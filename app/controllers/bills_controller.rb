class BillsController < ApplicationController
  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)

    if @bill.save
      redirect_to users_path
    else
      render :new
    end
  end

  private
    def bill_params
      params.require(:bill).permit(:amount, :foreign_country, :user_id)
    end
end
