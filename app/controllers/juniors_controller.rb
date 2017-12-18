class JuniorsController < ApplicationController
  #  before_action :authorize_admin, :only => [:new, :edit]

  def index
      @juniors = Junior.all
  end

  def show
    @junior = Junior.find(params[:id])
  end

  def new
    @junior = Junior.new
  end

  def create
    @junior = Junior.new(junior_params)
    if @junior.save
      # messing with alerts!
      flash[:notice] = "Wine Successfully added"
      redirect_to  juniors_path
    else
      render :new
    end
  end

  def edit
    @junior = Junior.find(params[:id])
  end

  def update
    @junior= Junior.find(params[:id])
    if @junior.update(junior_params)
      redirect_to juniors_path
    else
      render :edit
    end
  end

  def destroy
    @junior = Junior.find(params[:id])
    @junior.destroy
    redirect_to juniors_path
  end

private
  def junior_params
    params.require(:junior).permit(:image, :name, :price)
  end
end
