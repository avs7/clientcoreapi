class NotesController < ApplicationController
  before_action :ensure_authorized!
  def index
    @notes = current_user.notes
  end

  def show
    @note = current_user.notes.find(params[:id])
  end

  def create
    @note = current_user.notes.new(note_params)
    if @note.save
    else
      render @note.errors
    end
  end

  def update
    @note = current_user.notes.find(params[:id])
    if @note.update(note_params)
    else
      render @note.errors
    end
  end

  def destroy
    @note = current_user.notes.find(params[:id])
    @note.destroy
  end

  private
  def note_params
    params.require(:note).permit(:title, :details, :category)
  end
end