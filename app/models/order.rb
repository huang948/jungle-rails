class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true
  after_create :reduct_by_quantity

  def reduct_by_quantity
    self.line_items.each do |item|
      if item.product.quantity == 0
        return 0
      else 
        item.product.update_attribute('quantity', item.product.quantity - item.quantity)
      end
    end
  end

end
