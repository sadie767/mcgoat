class DoesPedigreesController < ApplicationController
  def new
      @doe = Doe.find(params[:doe_id])
      @does_pedigree = @doe.does_pedigrees.new
    end

    def create
      @doe = Doe.find(params[:doe_id])
      @does_pedigree = @doe.does_pedigrees.new(does_pedigree_params)
      if @does_pedigree.save
        flash[:alert] = "Does_Pedigree Successfully Added"
        redirect_to do_path(@does_pedigree.doe)
      else
        flash[:alert] = "There was a problem creating the pedigree."
        render :new
      end
    end

    def edit
      @doe = Doe.find(params[:doe_id])
      @does_pedigree = Does_Pedigree.find(params[:id])
    end

    def update
      @doe = Doe.find(params[:doe_id])
      @does_pedigree = Does_Pedigree.find(params[:id])
      if @does_pedigree.update(does_pedigree_params)
        flash[:alert] = "Does_Pedigree Successfully Updated"
        redirect_to do_path(@does_pedigree.doe)
      else
        flash[:alert] = "There was a problem with your update."
        render :edit
      end
    end

    def destroy
      @doe = Doe.find(params[:doe_id])
      @does_pedigree = Does_Pedigree.find(params[:id])
      @does_pedigree.destroy
      redirect_to do_path(@does_pedigree.doe)
    end

  private
    def does_pedigree_params
      params.require(:does_pedigree).permit(:pedigree, :doe_id)
    end
  end
