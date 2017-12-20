class BawardsController < ApplicationController
  def new
      @buck = Buck.find(params[:buck_id])
      @baward = @buck.bawards.new
    end

    def create
      @buck = Buck.find(params[:buck_id])
      @baward = @buck.bawards.new(baward_params)
      if @baward.save
        flash[:alert] = "Bucks_Award Successfully Added"
        redirect_to do_path(@baward.buck)
      else
        flash[:alert] = "There was a problem creating the award."
        render :new
      end
    end

    def edit
      @buck = Buck.find(params[:buck_id])
      @baward = Bucks_Award.find(params[:id])
    end

    def update
      @buck = Buck.find(params[:buck_id])
      @baward = Bucks_Award.find(params[:id])
      if @baward.update(baward_params)
        flash[:alert] = "Bucks_Award Successfully Updated"
        redirect_to buck_path(@baward.buck)
      else
        flash[:alert] = "There was a problem with your update."
        render :edit
      end
    end

    def destroy
      @buck = Buck.find(params[:buck_id])
      @baward = Bucks_Award.find(params[:id])
      @baward.destroy
      redirect_to buck_path(@baward.buck)
    end

  private
    def baward_params
      params.require(:baward).permit(:award, :pedigree, :buck_id)
    end
  end
