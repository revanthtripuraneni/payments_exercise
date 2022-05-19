class Loan < ActiveRecord::Base
    has_many :payments, dependent: :destroy

    def outstanding_balance
        return funded_amount if payments.empty?
        funded_amount - payments.inject(0) { |total, payment| total + (payment&.amount) || 0 }
    end

    def to_h
        attributes.merge({ outstanding_balance: outstanding_balance })
    end

    def self.payments_balance
        Loan.all.map { |loan| loan.to_h }
    end
end
