class DoesAwardsController < ApplicationController
  def new
      @doe = Doe.find(params[:doe_id])
      @does_award = @doe.does_awards.new
    end

    def create
      @doe = Doe.find(params[:doe_id])
      @does_award = @doe.does_awards.new(does_award_params)
      if @does_award.save
        flash[:alert] = "Does_Award Successfully Added"
        redirect_to do_path(@does_award.doe)
      else
        flash[:alert] = "There was a problem creating the award."
        render :new
      end
    end

    def edit
      @doe = Doe.find(params[:doe_id])
      @does_award = Does_Award.find(params[:id])
    end

    def update
      @doe = Doe.find(params[:doe_id])
      @does_award = Does_Award.find(params[:id])
      if @does_award.update(does_award_params)
        flash[:alert] = "Does_Award Successfully Updated"
        redirect_to do_path(@does_award.doe)
      else
        flash[:alert] = "There was a problem with your update."
        render :edit
      end
    end

    def destroy
      @doe = Doe.find(params[:doe_id])
      @does_award = Does_Award.find(params[:id])
      @does_award.destroy
      redirect_to do_path(@does_award.doe)
    end

  private
    def does_award_params
      params.require(:does_award).permit(:award, :pedigree, :doe_id)
    end
  end
