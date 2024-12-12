class NotesController < ApplicationController
  before_action :set_note, only: %i[ show edit update destroy ]

  def index()
    
    filters = params[:filters]&.to_unsafe_h&.symbolize_keys
    puts "FILTERS " + filters.inspect
    res = filters ?  filters[:sort_id] : "created_at DESC"
    @notes = Note.order(res)
    if(filters && (filters[:sort_id] == "created_at DESC" || filters[:sort_id] == "created_at ASC" ))
      @notes = @notes.group_by {|note| note.created_at.month}
      @notes = @notes.flatten(2)
    elsif not filters
      @notes = @notes.group_by {|note| note.created_at.month}
      @notes = @notes.flatten(2)
    end
    
    if filters && filters[:query].present? && filters[:sort_id].present? 
      type = filters[:sort_id].split(" ")
      if type[0] == 'created_at' && type[1].match(/\A(asc|desc)\z/i)
        @notes = Note.order(created_at: type[1])
        @notes = @notes.search_by_title(filters[:query] || " ")
        @notes = @notes.group_by {|note| note.created_at.month}
        @notes = @notes.flatten(2)
      elsif type[0] == 'title' && type[1].match(/\A(asc|desc)\z/i)
        @notes = Note.order(title: type[1])
        @notes = @notes.search_by_title(filters[:query] || " ")
      end
    end

    @notes
  end

 
  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to note_url(@note), notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to note_url(@note), notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
