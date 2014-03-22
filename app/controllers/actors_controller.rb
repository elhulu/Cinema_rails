class ActorsController < ApplicationController
  before_action :set_actor, only: [:show, :edit, :update, :destroy]

  # GET /actors
  # GET /actors.json
  def index
    @title_for_layout = "Acteurs"
    @actors = Actor.all
  end

  # GET /actors/1
  # GET /actors/1.json
  def show
    @title_for_layout = "Fiche acteur"
  end

  # GET /actors/new
  def new
    @title_for_layout = "Ajouter un acteur"
    @actor = Actor.new
  end

  # GET /actors/1/edit
  def edit
    @title_for_layout = "Modifier un acteur"
  end

  # POST /actors
  # POST /actors.json
  def create
    @actor = Actor.new(actor_params)

    respond_to do |format|
      if @actor.save
        format.html { redirect_to @actor, notice: 'Acteur ajoute.' }
        format.json { render action: 'show', status: :created, location: @actor }
      else
        format.html { render action: 'new' }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actors/1
  # PATCH/PUT /actors/1.json
  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html { redirect_to @actor, notice: 'Actor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actors/1
  # DELETE /actors/1.json
  def destroy
    @actor.destroy
    respond_to do |format|
      format.html { redirect_to actors_url }
      format.json { head :no_content }
    end
  end

  private
    def set_actor
      @actor = Actor.find(params[:id])
    end

    def actor_params
      params.require(:actor).permit(:first_name, :last_name, :picture)
    end
end
