class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]
	before_action	:correct_user, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    @quotes = Quote.all
    respond_with(@quotes)
  end

  def show
    respond_with(@quote)
  end

  def new
		@quote = current_user.quotes.build
    respond_with(@quote)
  end

  def edit
  end

  def create
    @quote = current_user.quotes.build(quote_params)
    @quote.save
    respond_with(@quote)
  end

  def update
    @quote.update(quote_params)
    respond_with(@quote)
  end

  def destroy
    @quote.destroy
    respond_with(@quote)
  end

  private
    def set_quote
      @quote = Quote.find(params[:id])
    end
	
		def correct_user
			@quote = current_user.quotes.find_by(id: params[:id])
			redirect_to quotes_path, notice: "Not authorized to edit this quote" if@quote.nil?
		end

    def quote_params
      params.require(:quote).permit(:season, :episode, :character, :description)
    end
end
