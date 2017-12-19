class BucksAwardsController < ApplicationController
  def new
      @buck = Buck.find(params[:buck_id])
      @bucks_award = @buck.bucks_awards.new
    end

    def create
      @buck = Buck.find(params[:buck_id])
      @bucks_award = @buck.bucks_awards.new(bucks_award_params)
      if @bucks_award.save
        flash[:alert] = "Bucks_Award Successfully Added"
        redirect_to buck_path(@bucks_award.buck)
      else
        flash[:alert] = "There was a problem creating the award."
        render :new
      end
    end

    def edit
      @buck = Buck.find(params[:buck_id])
      @bucks_award = Bucks_Award.find(params[:id])
    end

    def update
      @buck = Buck.find(params[:buck_id])
      @bucks_award = Bucks_Award.find(params[:id])
      if @bucks_award.update(bucks_award_params)
        flash[:alert] = "Bucks_Award Successfully Updated"
        redirect_to buck_path(@bucks_award.buck)
      else
        flash[:alert] = "There was a problem with your update."
        render :edit
      end
    end

    def destroy
      @buck = Buck.find(params[:buck_id])
      @bucks_award = Bucks_Award.find(params[:id])
      @bucks_award.destroy
      redirect_to buck_path(@bucks_award.buck)
    end

  private
    def bucks_award_params
      params.require(:bucks_award).permit(:award, :pedigree, :buck_id)
    end
  end
