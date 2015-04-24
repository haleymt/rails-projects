class AlbumsController < ApplicationController
  
  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] = "Created #{@album.title} by #{@album.band.name}"
      render :show
    else
      render :new
    end
  end

  def edit
    @albums = Album.all
    @album = @albums.find(params[:id])
    render :edit
  end

  def show
    @albums = Album.all
    @album = @albums.find(params[:id])
    render :show
  end

  def update
    @album = Album.all.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end
  end

  def destroy
    @album = Album.all.find(params[:id])
    band = @album.band
    @album.destroy
    flash[:notice] = "Album removed"
    redirect_to band_url(band)
  end

  private

    def album_params
      self.params.require(:album).permit(:title, :band_id, :album_type)
    end

end
