class DawardsController < ApplicationController
  before_action :authorize
  before_action :authorize_admin

  def new
      @doe = Doe.find(params[:doe_id])
      @daward = @doe.dawards.new
    end

    def create
      @doe = Doe.find(params[:doe_id])
      @daward = @doe.dawards.new(daward_params)
      if @daward.save
        flash[:alert] = "Does_Award Successfully Added"
        redirect_to do_path(@daward.doe)
      else
        flash[:alert] = "There was a problem creating the award."
        render :new
      end
    end

    def edit
      @doe = Doe.find(params[:doe_id])
      @daward = Does_Award.find(params[:id])
    end

    def update
      @doe = Doe.find(params[:doe_id])
      @daward = Does_Award.find(params[:id])
      if @daward.update(daward_params)
        flash[:alert] = "Does_Award Successfully Updated"
        redirect_to do_path(@daward.doe)
      else
        flash[:alert] = "There was a problem with your update."
        render :edit
      end
    end

    def destroy
      @doe = Doe.find(params[:doe_id])
      @daward = Does_Award.find(params[:id])
      @daward.destroy
      redirect_to do_path(@daward.doe)
    end

  private
    def daward_params
      params.require(:daward).permit(:award, :pedigree, :doe_id)
    end
  end
