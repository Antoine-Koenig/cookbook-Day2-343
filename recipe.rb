class Recipe
  attr_reader :name, :description, :prep_time

  def initialize(params)
    @name = params[:name]
    @description = params[:description]
    @prep_time = params[:prep_time] || "?"
    @done = params[:done] || false
  end

  def done!
    @done = true
  end

  def done?
    @done
  end
end
