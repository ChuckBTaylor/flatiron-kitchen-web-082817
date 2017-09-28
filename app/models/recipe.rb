class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true


  def ingredient_names=(names)
    names.each do |name|
      ingredient = Ingredient.find_or_create_by(name: name)
      self.ingredients << ingredient
    end
  end

  def ingredient_names
    Ingredient.all.first.name
  end


  private


end
