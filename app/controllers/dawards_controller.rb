class DawardsController < ApplicationController
  before_action :authorize
  before_action :authorize_admin

  def new
      @doe = Doe.find(params[:do_id])
      @daward = @doe.dawards.new
    end

    def create
      @doe = Doe.find(params[:do_id])
      @daward = @doe.dawards.new(daward_params)
      if @daward.save
        flash[:alert] = "Doe's Accolade Successfully Added."
        redirect_to do_path(@daward.doe)
      else
        flash[:alert] = "There Was a Problem Creating the Accolade."
        render :new
      end
    end

    def edit
      @doe = Doe.find(params[:do_id])
      @daward = Daward.find(params[:id])
    end

    def update
      @doe = Doe.find(params[:do_id])
      @daward = Daward.find(params[:id])
      if @daward.update(daward_params)
        flash[:alert] = "Doe's Accolade Successfully Updated."
        redirect_to do_path(@daward.doe)
      else
        flash[:alert] = "There Was a Problem With Your Update."
        render :edit
      end
    end

    def destroy
      @doe = Doe.find(params[:do_id])
      @daward = Daward.find(params[:id])
      @daward.destroy
      redirect_to do_path(@daward.doe)
    end

  private
    def daward_params
      params.require(:daward).permit(:award, :pedigree, :do_id)
    end
  end
