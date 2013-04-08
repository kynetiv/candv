# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#  description :text
#  pricing     :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :description, :name, :pricing
  validates :category, :description, :name, :pricing, :presence => true

end
