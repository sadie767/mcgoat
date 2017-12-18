class DoesController < ApplicationController
  #  before_action :authorize_admin, :only => [:new, :edit]

  def index
      @does = Doe.all
  end

  def show
    @doe = Doe.find(params[:id])
  end

  def new
    @doe = Doe.new
  end

  def create
    @doe = Doe.new(doe_params)
    if @doe.save
      # messing with alerts!
      flash[:notice] = "Wine Successfully added"
      redirect_to  does_path
    else
      render :new
    end
  end

  def edit
    @doe = Doe.find(params[:id])
  end

  def update
    @doe= Doe.find(params[:id])
    if @doe.update(doe_params)
      redirect_to does_path
    else
      render :edit
    end
  end

  def destroy
    @doe = Doe.find(params[:id])
    @doe.destroy
    redirect_to does_path
  end

private
  def doe_params
    params.require(:doe).permit(:image, :name, :price)
  end
end
