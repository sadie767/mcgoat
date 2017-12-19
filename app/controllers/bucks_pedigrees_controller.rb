class BucksPedigreesController < ApplicationController
  def new
      @buck = Buck.find(params[:buck_id])
      @bucks_pedigree = @buck.bucks_pedigrees.new
    end

    def create
      @buck = Buck.find(params[:buck_id])
      @bucks_pedigree = @buck.bucks_pedigrees.new(bucks_pedigree_params)
      if @bucks_pedigree.save
        flash[:alert] = "Bucks_Pedigree Successfully Added"
        redirect_to buck_path(@bucks_pedigree.buck)
      else
        flash[:alert] = "There was a problem creating the pedigree."
        render :new
      end
    end

    def edit
      @buck = Buck.find(params[:buck_id])
      @bucks_pedigree = Bucks_Pedigree.find(params[:id])
    end

    def update
      @buck = Buck.find(params[:buck_id])
      @bucks_pedigree = Bucks_Pedigree.find(params[:id])
      if @bucks_pedigree.update(bucks_pedigree_params)
        flash[:alert] = "Bucks_Pedigree Successfully Updated"
        redirect_to buck_path(@bucks_pedigree.buck)
      else
        flash[:alert] = "There was a problem with your update."
        render :edit
      end
    end

    def destroy
      @buck = Buck.find(params[:buck_id])
      @bucks_pedigree = Bucks_Pedigree.find(params[:id])
      @bucks_pedigree.destroy
      redirect_to buck_path(@bucks_pedigree.buck)
    end

  private
    def bucks_pedigree_params
      params.require(:bucks_pedigree).permit(:pedigree, :buck_id)
    end
  end
