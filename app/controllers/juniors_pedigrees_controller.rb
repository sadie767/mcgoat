class JuniorsPedigreesController < ApplicationController
  def new
      @junior = Junior.find(params[:junior_id])
      @juniors_pedigree = @junior.juniors_pedigrees.new
    end

    def create
      @junior = Junior.find(params[:junior_id])
      @juniors_pedigree = @junior.juniors_pedigrees.new(juniors_pedigree_params)
      if @juniors_pedigree.save
        flash[:alert] = "Juniors_Pedigree Successfully Added"
        redirect_to junior_path(@juniors_pedigree.junior)
      else
        flash[:alert] = "There was a problem creating the pedigree."
        render :new
      end
    end

    def edit
      @junior = Junior.find(params[:junior_id])
      @juniors_pedigree = Juniors_Pedigree.find(params[:id])
    end

    def update
      @junior = Junior.find(params[:junior_id])
      @juniors_pedigree = Juniors_Pedigree.find(params[:id])
      if @juniors_pedigree.update(juniors_pedigree_params)
        flash[:alert] = "Juniors_Pedigree Successfully Updated"
        redirect_to junior_path(@juniors_pedigree.junior)
      else
        flash[:alert] = "There was a problem with your update."
        render :edit
      end
    end

    def destroy
      @junior = Junior.find(params[:junior_id])
      @juniors_pedigree = Juniors_Pedigree.find(params[:id])
      @juniors_pedigree.destroy
      redirect_to junior_path(@juniors_pedigree.junior)
    end

  private
    def juniors_pedigree_params
      params.require(:juniors_pedigree).permit(:pedigree, :junior_id)
    end
  end
