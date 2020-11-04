class PagesController < ApplicationController
  def index
    session[:images] = session[:images] || []

    if session[:images].empty? || params["button_action"] == "refresh"
      session[:images] = get_scryfall_images
    end
  end

  private

  def get_json(url)
    response = RestClient.get(url)
    json = JSON.parse(response)
  end

  def parse_cards(json, images)
    array = json["data"]
    array.each do |card_hash|
      if card_hash["image_uris"]
        image_hash = {
          "image" => card_hash["image_uris"]["art_crop"],
          "name" => card_hash["name"]
          "artist" => card_hash["artist"]
        }
        images << image_hash
      end
    end
  end

  def get_scryfall_images
    api_url = "https://api.scryfall.com/cards/search?q="
    images = []
    monster_search_array = ["merfolk", "goblin", "angel", "sliver"]

    monster_search_array.each do |monster|
      search_url = api_url + "t%3Alegend+t%3A" + monster
      json = get_json(search_url)
      parse_cards(json, images)

      sleep(0.1)
    end
    images.sample(10)
  end
end
