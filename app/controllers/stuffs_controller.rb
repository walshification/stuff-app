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

  def favorite
    @stuff = Stuff.find(params[:id])
    @stuff.update(favorite: true)
    respond_to do |format|
      format.js do
        render "favorite.js.erb", locals: { stuff: @stuff }
      end
    end
  end

  def unfavorite
    @stuff = Stuff.find(params[:id])
    @stuff.update(favorite: false)
    respond_to do |format|
      format.js do
        render "unfavorite.js.erb", locals: { stuff: @stuff }
      end
    end
  end

  private

  def stuff_params
    params.require(:stuff).permit(:name, :favorite)
  end
end
