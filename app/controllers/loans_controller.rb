class LoansController < ActionController::API
  def index
    render json: Loan.all
  end

  def show
    render json: Loan.find(params[:id]).to_h
  end
end
