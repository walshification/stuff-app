class StuffsController < ApplicationController
  def index
    @stuffs = Stuff.all
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

  private

  def stuff_params
    params.require(:stuff).permit(:name, :favorite)
  end
end
