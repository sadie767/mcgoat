class BucksController < ApplicationController
  before_action :authorize, :only => [:new, :edit]
  before_action :authorize_admin, :only => [:new, :edit]

  def index
      @bucks = Buck.all
  end

  def show
    @buck = Buck.find(params[:id])
  end

  def new
    @buck = Buck.new
  end

  def create
    @buck = Buck.new(buck_params)
    if @buck.save
      flash[:notice] = "Buck Successfully added."
      redirect_to  bucks_path
    else
      render :new
    end
  end

  def edit
    @buck = Buck.find(params[:id])
  end

  def update
    @buck= Buck.find(params[:id])
    if @buck.update(buck_params)
      redirect_to bucks_path
    else
      render :edit
    end
  end

  def destroy
    @buck = Buck.find(params[:id])
    @buck.destroy
    redirect_to bucks_path
  end

private
  def buck_params
    params.require(:buck).permit(:image, :name, :price)
  end
end
