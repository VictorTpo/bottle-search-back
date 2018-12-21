class BottlesController < ApplicationController
  def search
    @search = BottleFinder.new(params).call
  end

  def show
    @bottle = Bottle.find(params[:id])
  end

  def create
    @creator = BottleCreator.new(params)
    if @creator.valid?
      @creator.save
      render json: { message: 'created', id: @creator.id }, status: 201
    else
      render_errors(@creator)
    end
  end
end
