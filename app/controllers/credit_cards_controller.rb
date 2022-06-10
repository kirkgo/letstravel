class CreditCardsController < ApplicationController
  before_action :set_credit_card, only: %i[ show edit update destroy ]

  # GET /credit_cards or /credit_cards.json
  def index
    @credit_cards = current_user.credit_cards
  end

  # GET /credit_cards/1 or /credit_cards/1.json
  def show
  end

  # GET /credit_cards/new
  def new
    @credit_card = CreditCard.new
  end

  # GET /credit_cards/1/edit
  def edit
  end

  # POST /credit_cards or /credit_cards.json
  def create
    @credit_card = CreditCard.new(credit_card_params)
    if @credit_card.save
      redirect_to credit_cards_path
    else
      render :new
    end
  end

  # PATCH/PUT /credit_cards/1 or /credit_cards/1.json
  def update
    if @credit_card.update(credit_card_params)
      redirect_to credit_card_url(@credit_card), notice: "Credit card was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /credit_cards/1 or /credit_cards/1.json
  def destroy
    @credit_card.destroy
    redirect_to credit_cards_url, notice: "Credit card was successfully destroyed."
  end

  private

  def set_credit_card
    @credit_card = CreditCard.find(params[:id])
  end

  def credit_card_params
    params.require(:credit_card).permit(:user_id, :cardholder, :number, :expire_date, :cvv)
  end
end
