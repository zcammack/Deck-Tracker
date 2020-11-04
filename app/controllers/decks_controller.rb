class DecksController < ApplicationController
        before action :set_deck!, only: [:show, :edit, :update, :destroy]
    def new
        @deck = Deck.new
    end

    def create
        @deck = Deck.new(deck_params)
        if @deck.save
            redirect_to deck_path(@deck)
        else
            render "new"
        end
    end

    def index
        @decks = Deck.all
    end

    def show

    end

    def edit

    end

    def update
        if @deck.update(deck_params)
            redirect_to deck_path(@deck)
        else
            render "edit"
        end
    end

    def destroy
        @deck.destroy
        redirect_to decks_path
    end

    private

    def set_deck!
        @deck = Deck.find(params[:id])
    end

    def deck_params
        params.require(:deck).permit()
    end
end