class BusinessCardsController < ApplicationController
  def index
    @business_cards = BusinessCard.all
  end

  def new
    @business_card = BusinessCard.new
  end

  def create
    @business_card = BusinessCard.new(params[:business_card])

    if @business_card.save
      redirect_to business_cards_path
    else
      render 'new'
    end
  end
end
