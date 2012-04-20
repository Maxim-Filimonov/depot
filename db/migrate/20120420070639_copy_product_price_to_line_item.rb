class CopyProductPriceToLineItem < ActiveRecord::Migration
  def up
    LineItem.all.each do |line_item|
      line_item.update_attribute(:price,line_item.product.price)
    end
  end

  def down
    LineItem.all.each do |line_item|
      line_item.update_attribute(:price,0)
    end
  end
end
