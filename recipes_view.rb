class RecipesView
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      check = recipe.done? ? "[X]" : "[ ]"
      puts "#{index + 1} - #{check} #{recipe.name} : #{recipe.description} (#{recipe.prep_time})"
    end
  end

  def ask_user_for_string(element)
    puts "#{element.capitalize}, please?"
    print "> "
    return gets.chomp
  end

  def ask_user_for_index
    puts "Index, please?"
    print "> "
    return gets.chomp.to_i - 1
  end
end
