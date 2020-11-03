class CardsController < ApplicationController
        before action :set_card!, only: [:show, :edit, :update, :destroy]
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
        if @card.update(card_params)
            redirect_to card_path(@card)
        else
            render "edit"
        end
    end

    def destroy
        @card.destroy
        redirect_to cards_path
    end

    private

    def set_card!
        @card = Card.find(params[:id])
    end

    def card_params
        params.require(:card).permit(:name, :effect, :cost, :color, :attack_value, :health_value, :type)
    end
end