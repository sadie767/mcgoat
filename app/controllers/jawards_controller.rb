class JawardsController < ApplicationController
  before_action :authorize
  before_action :authorize_admin

  def new
      @junior = Junior.find(params[:junior_id])
      @jaward = @junior.jawards.new
    end

    def create
      @junior = Junior.find(params[:junior_id])
      @jaward = @junior.jawards.new(jaward_params)
      if @jaward.save
        flash[:alert] = "Juniors_Award Successfully Added"
        redirect_to junior_path(@jaward.junior)
      else
        flash[:alert] = "There was a problem creating the award."
        render :new
      end
    end

    def edit
      @junior = Junior.find(params[:junior_id])
      @jaward = Juniors_Award.find(params[:id])
    end

    def update
      @junior = Junior.find(params[:junior_id])
      @jaward = Juniors_Award.find(params[:id])
      if @jaward.update(jaward_params)
        flash[:alert] = "Juniors_Award Successfully Updated"
        redirect_to junior_path(@jaward.junior)
      else
        flash[:alert] = "There was a problem with your update."
        render :edit
      end
    end

    def destroy
      @junior = Junior.find(params[:junior_id])
      @jaward = Juniors_Award.find(params[:id])
      @jaward.destroy
      redirect_to junior_path(@jaward.junior)
    end

  private
    def jaward_params
      params.require(:jaward).permit(:award, :pedigree, :junior_id)
    end
  end
