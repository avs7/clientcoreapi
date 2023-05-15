class NotesController < ApplicationController
  before_action :ensure_authorized!
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
    else
      render @note.errors
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
    else
      render @note.errors
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
  end

  private
  def note_params
    params.require(:note).permit(:title, :details, :category)
  end
end