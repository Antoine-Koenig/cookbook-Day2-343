require_relative "router"
require_relative "recipes_controller"
require_relative "cookbook"

csv_file = "recipes.csv"
cookbook = Cookbook.new(csv_file)
recipes_controller = RecipesController.new(cookbook)
router = Router.new(recipes_controller)

router.run
