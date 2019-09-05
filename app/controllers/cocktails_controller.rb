require "json"
require 'open-uri'

class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @review = Review.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
    #set flat
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    @cocktail.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to root_path
  end

  # def self.get_photo_url
  #   url = "https://api.unsplash.com/search/photos?page=1&query=office"
  #   url_serialized = open(url).read
  #   repos = JSON.parse(url_serialized)
  #   "url"
  # end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:cocktail).permit(:name)
  end
end


# CocktailsController.get_photo_url
