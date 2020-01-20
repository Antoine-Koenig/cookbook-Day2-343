require_relative "recipes_view"
require_relative "recipe"
require_relative "scraping_service"

class RecipesController
  def initialize(cookbook)
    @cookbook = cookbook
    @recipes_view = RecipesView.new
  end

  def list
    display_recipes
  end

  def create
    name = @recipes_view.ask_user_for_string("name")
    description = @recipes_view.ask_user_for_string("description")
    prep_time = @recipes_view.ask_user_for_string("preparation time")
    recipe = Recipe.new({ name: name, description: description, prep_time: prep_time })
    @cookbook.add(recipe)
    display_recipes
  end

  def destroy
    display_recipes
    index = @recipes_view.ask_user_for_index
    @cookbook.remove(index)
    display_recipes
  end

  def import
    ingredient = @recipes_view.ask_user_for_string("ingredient")
    scraping_service = ScrapingService.new
    suggested_recipes = scraping_service.call(ingredient)
    @recipes_view.display_recipes(suggested_recipes)
    index = @recipes_view.ask_user_for_index
    recipe = suggested_recipes[index]
    @cookbook.add(recipe)
    display_recipes
  end

  def mark_as_done
    display_recipes
    index = @recipes_view.ask_user_for_index
    @cookbook.update(index)
    display_recipes
  end


  private

  def display_recipes
    recipes = @cookbook.all
    @recipes_view.display_recipes(recipes)
  end

end
