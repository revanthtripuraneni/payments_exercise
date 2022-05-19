class Payment < ActiveRecord::Base
    belongs_to :loan

    validates :amount, presence: true
    validates :date, presence: true
    validate :not_greater_than_outstanding_balance

    def create(params)
        params[:date] = Time.at(params[:date])
        super
    end

    private

    def not_greater_than_outstanding_balance
        return errors.add(:loan, "must be associated") if !loan
        return true if amount <= loan.outstanding_balance
        errors.add(:amount, "is larger than outstanding loan balance")
    end
end
