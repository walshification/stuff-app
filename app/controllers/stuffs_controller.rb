class StuffsController < ApplicationController
  def index
    @favorite_stuffs = Stuff.where(favorite: true)
    @stuffs = Stuff.where(favorite: false)
  end

  def show
    @stuff = Stuff.find(params[:id])
  end

  def new
  end

  def create
    @stuff = Stuff.new(stuff_params)
    if @stuff.save
      redirect_to stuffs_path
    end
  end

  def destroy
    @stuff = Stuff.find(params[:id])
    @stuff.destroy!
  end

  def favorite
    @stuff = Stuff.find(params[:id])
    @stuff.update(favorite: true)
    redirect_to stuffs_path
  end

  def unfavorite
    @stuff = Stuff.find(params[:id])
    @stuff.update(favorite: false)
    redirect_to stuffs_path
  end

  private

  def stuff_params
    params.require(:stuff).permit(:name, :favorite)
  end
end
