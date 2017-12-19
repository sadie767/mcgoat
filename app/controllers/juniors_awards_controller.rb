class JuniorsAwardsController < ApplicationController
  def new
      @junior = Junior.find(params[:junior_id])
      @juniors_award = @junior.juniors_awards.new
    end

    def create
      @junior = Junior.find(params[:junior_id])
      @juniors_award = @junior.juniors_awards.new(juniors_award_params)
      if @juniors_award.save
        flash[:alert] = "Juniors_Award Successfully Added"
        redirect_to junior_path(@juniors_award.junior)
      else
        flash[:alert] = "There was a problem creating the award."
        render :new
      end
    end

    def edit
      @junior = Junior.find(params[:junior_id])
      @juniors_award = Juniors_Award.find(params[:id])
    end

    def update
      @junior = Junior.find(params[:junior_id])
      @juniors_award = Juniors_Award.find(params[:id])
      if @juniors_award.update(juniors_award_params)
        flash[:alert] = "Juniors_Award Successfully Updated"
        redirect_to junior_path(@juniors_award.junior)
      else
        flash[:alert] = "There was a problem with your update."
        render :edit
      end
    end

    def destroy
      @junior = Junior.find(params[:junior_id])
      @juniors_award = Juniors_Award.find(params[:id])
      @juniors_award.destroy
      redirect_to junior_path(@juniors_award.junior)
    end

  private
    def juniors_award_params
      params.require(:juniors_award).permit(:award, :pedigree, :junior_id)
    end
  end
