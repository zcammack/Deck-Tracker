class PagesController < ApplicationController
  def index
    session[:images] = session[:images] || []

    if session[:images].empty? || params["button_action"] == "refresh"
      session[:images] = get_scryfall_images
    end
  end
end
