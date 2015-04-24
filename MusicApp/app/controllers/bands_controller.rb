class BandsController < ApplicationController

  def index
    @bands = Band.all
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      flash[:notice] = "Created #{@band.name}"
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    @bands = Band.all
    @band = @bands.find(params[:id])
    render :edit
  end

  def show
    @bands = Band.all
    @band = @bands.find(params[:id])
    render :show
  end

  def update
    @band = Band.all.find(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      render :edit
    end
  end

  def destroy
    @band = Band.all.find(params[:id])
    @band.destroy
    flash[:notice] = "Band removed"
    redirect_to bands_url
  end

  private

    def band_params
      self.params.require(:band).permit(:name)
    end

end
