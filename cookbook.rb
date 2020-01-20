require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  #create
  def add(recipe)
    @recipes << recipe
    save_csv
  end


  # Read
  def all
    @recipes
  end


  # Update
  def update(index)
    recipe = @recipes[index]
    recipe.done!
    save_csv
  end

  # Delete
  def remove(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @recipes << Recipe.new(row)
    end
  end

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file, 'wb', csv_options) do |csv|
      csv << ["name", "description", "prep_time"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time]
      end
    end
  end

end








