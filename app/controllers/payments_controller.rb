class PaymentsController < ApplicationController
    before_action :latest_loan

    def index
        render json: @loan.payments
    end

    def show
        render json: Payment.find(params[:id])
    end

    def create
        @payment = @loan.payments.build(payment_params)

        if @payment.save
            render json: @payment, status: :created
        else
            render json: @payment.errors, status: :something_wrong
        end
    end

    private

    def latest_loan
        @loan = Loan.find(params[:load_id])
    end

    def payment_params
        params.require(:payment).permit(:amount, :date)
    end
end