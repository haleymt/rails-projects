class NotesController < ApplicationController

  def new
    @note = Note.new
    render :new
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      flash[:notice] = "Thanks for the note!"
      redirect_to track_url(@note.track)
    else
      render :new
    end
  end

  # def edit
  #   @track = Track.all.find(params[:id])
  #   render :edit
  # end

  # def show
  #   @track = Track.all.find(params[:id])
  #   render :show
  # end

  # def update
  #   @track = Track.all.find(params[:id])
  #   if @track.update(track_params)
  #     flash[:notice] = "Track updated"
  #     render :show
  #   else
  #     render :update
  #   end
  # end

  def destroy
    @note = Note.all.find(params[:id])
    track = @note.track
    if check_creator
      @note.destroy
      flash[:notice] = "Note removed"
      redirect_to track_url(track)
    end
  end

  def check_creator
    @note = Note.all.find(params[:id])
    if @note.user_id == current_user.id
      return true
    else
      flash[:notice] = "This isn't your note..."
      redirect_to track_url(@note.track)
    end
  end

  private

    def note_params
      self.params.require(:note).permit(:track_id, :user_id, :body)
    end
end
