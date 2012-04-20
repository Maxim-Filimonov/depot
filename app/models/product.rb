class Product < ActiveRecord::Base
  validates :title, :image_url,:description, presence:true
  validates :price, numericality: { greater_than_or_equal_to:0.01 }
  validates_uniqueness_of :title 
  validates :image_url, allow_blank:true, format: {
    with: %r{\.(gif|jpg|png)$}i,
    message: "must be a URL for GIF,JPG or PNG image."
  }
  validates_length_of :description, maximum: 80
  attr_accessible :description, :image_url, :price, :title

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  private
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base,'Line items present')
        return false
      end
    end
end
