class Router
  def initialize(recipes_controller)
    @recipes_controller = recipes_controller
  end

  def display_menu
    puts ""
    puts "======= MENU ========"
    puts "1 - List recipes"
    puts "2 - Add recipe"
    puts "3 - destroy recipe"
    puts "4 - Import from Marmiton"
    puts "5 - Mark as done"
    puts "6 - quit"
    puts "====================="
    puts ""
  end

  def ask_choice
    "Your choice, please?"
    return gets.chomp.to_i
  end


  def run
    loop do
      display_menu
      choice  = ask_choice

      case choice
      when 1 then @recipes_controller.list
      when 2 then @recipes_controller.create
      when 3 then @recipes_controller.destroy
      when 4 then @recipes_controller.import
      when 5 then @recipes_controller.mark_as_done
      when 6 then break
      else
        puts "Just 1, 2, 3, or 4!!!!"
      end
    end
  end
end
