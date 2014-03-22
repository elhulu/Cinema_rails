class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :edit, :update, :destroy]

  # /films
  # /films.json
  def index
    @title_for_layout = "Liste des films"
    @films = Film.all
  end

  # /films/1
  # /films/1.json
  def show
    @film = Film.find(params[:id])
    @title_for_layout = "Fiche du film " + @film.name
  end

  # /films/new
  def new
    @title_for_layout = "Ajouter un film"
    @film = Film.new
    @actors = Actor.all
  end

  # /films/1/edit
  def edit
    @film = Film.find(params[:id])
    @title_for_layout = "Edition du film : " + @film.name
    @actors = Actor.all
  end

  # POST /films
  # POST /films.json
  def create
    @film = Film.new(film_params)

    respond_to do |format|
      if params[:film][:actor_ids] && params[:film][:actor_ids].size > 1
          if @film.save
            format.html { redirect_to @film, notice: 'Film enregistre.' }
            format.json { render action: 'show', status: :created, location: @film }
          else
            @actors = Actor.all
            flash[:error_msg] = "Une erreur est survenue, merci de reessayer plus tard."
            format.html { render action: 'new' }
            format.json { render json: @film.errors, status: :unprocessable_entity }
          end
      else
        @actors = Actor.all
        flash[:error_msg] = "Merci de selectionner au moins deux acteurs."
        format.html { render action: 'new' }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /films/1
  # PATCH/PUT /films/1.json
  def update
    respond_to do |format|
      if @film.update(film_params)
        format.html { redirect_to @film, notice: 'Film mis a jour.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film.destroy
    respond_to do |format|
      format.html { redirect_to films_url }
      format.json { head :no_content }
    end
  end

  private
    def set_film
      @film = Film.find(params[:id])
    end

    def film_params
      params.require(:film).permit(:name, :description, :picture, :actor_ids => [])
    end
end
