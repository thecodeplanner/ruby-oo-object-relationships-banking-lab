class Transfer

  attr_accessor :receiver, :amount, :sender, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status == "pending" 
      if self.valid? && self.sender.balance >= self.amount
        self.receiver.deposit(self.amount)
        self.sender.balance -= self.amount
        self.status = "complete"
      else 
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      transfer_new = Transfer.new(self.receiver,self.sender,amount)
      transfer_new.execute_transaction
      if(transfer_new.status == "complete")
        self.status = "reversed"
      else 
        "reverse not complete"
      end
    else
      "reverse not complete"
    end
  end

end





