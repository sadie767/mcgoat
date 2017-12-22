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
        flash[:alert] = "Junior's Accolade Successfully Added"
        redirect_to junior_path(@jaward.junior)
      else
        flash[:alert] = "There Was a Problem Creating the Award."
        render :new
      end
    end

    def edit
      @junior = Junior.find(params[:junior_id])
      @jaward = Jaward.find(params[:id])
    end

    def update
      @junior = Junior.find(params[:junior_id])
      @jaward = Jaward.find(params[:id])
      if @jaward.update(jaward_params)
        flash[:alert] = "Junior's Accolade Successfully Updated"
        redirect_to junior_path(@jaward.junior)
      else
        flash[:alert] = "There Was a Problem With Your Update."
        render :edit
      end
    end

    def destroy
      @junior = Junior.find(params[:junior_id])
      @jaward = Jaward.find(params[:id])
      @jaward.destroy
      redirect_to junior_path(@jaward.junior)
    end

  private
    def jaward_params
      params.require(:jaward).permit(:award, :pedigree, :junior_id)
    end
  end
