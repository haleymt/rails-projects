class TracksController < ApplicationController

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      flash[:notice] = "Created #{@track.song}"
      render :show
    else
      render :new
    end
  end

  def edit
    @track = Track.all.find(params[:id])
    render :edit
  end

  def show
    @track = Track.all.find(params[:id])
    render :show
  end

  def update
    @track = Track.all.find(params[:id])
    if @track.update(track_params)
      flash[:notice] = "Track updated"
      render :show
    else
      render :update
    end
  end

  def destroy
    @track = Track.all.find(params[:id])
    album = @track.album
    @track.destroy
    flash[:notice] = "Track removed"
    redirect_to album_url(album)
  end

  private

    def track_params
      self.params.require(:track).permit(:song, :album_id, :track_type, :lyrics)
    end

end
