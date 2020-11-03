class CardsController < ApplicationController

    def new
        @card = Card.new
    end

    def create
        @card = Card.new(card_params)
        if @card.save
            redirect_to card_path(@card)
        else
            render "new"
        end
    end

    def index
        @cards = Card.all
    end

    def show

    end

    def edit

    end

    def update

    end

    def destroy

    end

    
end