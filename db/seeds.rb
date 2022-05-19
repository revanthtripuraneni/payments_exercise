loan = Loan.create!(funded_amount: 100.0)
Payment.create!(amount: 50.00, date: Time.now, loan_id: loan.id)