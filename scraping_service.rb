require 'open-uri'
require 'nokogiri'
require "pry-byebug"
require_relative "recipe"

class ScrapingService
  def call(ingredient)
    url = "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=#{ingredient}"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    recipes = []
    cards = html_doc.search(".recipe-card").first(5)
    cards.each do |card|
      name = card.search(".recipe-card__title").text.strip
      description = card.search(".recipe-card__description").text.strip
      prep_time = card.search(".recipe-card__duration__value").text.strip
      recipe = Recipe.new(name: name, description: description, prep_time: prep_time)
      recipes << recipe
    end
    return recipes
  end

end
