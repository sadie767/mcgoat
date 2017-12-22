class BawardsController < ApplicationController
  before_action :authorize, :only => [:new, :edit]
  before_action :authorize_admin

  def new
      @buck = Buck.find(params[:buck_id])
      @baward = @buck.bawards.new
    end

    def create
      @buck = Buck.find(params[:buck_id])
      @baward = @buck.bawards.new(baward_params)
      if @baward.save
        flash[:alert] = "Buck's Accolades Created Successfully."
        redirect_to buck_path(@baward.buck)
      else
        flash[:alert] = "There Was a  Problem Creating the Accolade."
        render :new
      end
    end

    def edit
      @buck = Buck.find(params[:buck_id])
      @baward = Baward.find(params[:id])
    end

    def update
      @buck = Buck.find(params[:buck_id])
      @baward = Baward.find(params[:id])
      if @baward.update(baward_params)
        flash[:alert] = "Buck's Accolades Successfully Updated."
        redirect_to buck_path(@baward.buck)
      else
        flash[:alert] = "There Was a Problem With Your Update."
        render :edit
      end
    end

    def destroy
      @buck = Buck.find(params[:buck_id])
      @baward = Baward.find(params[:id])
      @baward.destroy
      redirect_to buck_path(@baward.buck)
    end

  private
    def baward_params
      params.require(:baward).permit(:award, :pedigree, :buck_id)
    end
  end
