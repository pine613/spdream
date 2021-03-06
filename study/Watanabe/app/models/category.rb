class Category < ActiveRecord::Base
  attr_accessible :description, :name, :priority

  has_many :child_categories, :order => 'priority'
  has_many :books

end
