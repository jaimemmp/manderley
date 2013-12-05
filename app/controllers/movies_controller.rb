class MoviesController < ApplicationController
  before_action :set_movie, except: [:index, :new, :create]
  before_filter :authenticate_user!, except: [:index, :show]
  TweetWorker.perform_async(1, 1)
  def new_cast
    @people = @movie.people.all
    @cast = @movie.casts.build
  end

  def add_cast
    respond_to do |format|
        format.html { redirect_to @movie, notice: 'ADDDDDDDDDD.' }
    end
  end

  def destroy_cast
    @movie.casts.find(params[:id]).destroy
    respond_to do |format|
        format.html { redirect_to @movie, notice: 'Cast deleted.' }
    end
  end

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
    respond_to do |format|
      format.html { render action: "index" }
      format.json { render action: 'index' }
    end
  end

  # GET /movies/1
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  #DELETE /movies/1
  #DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_path }
      format.json { head :no_content }
      format.js { render partial: 'destroy_animation', locals: {resource: @movie} }
    end
  end
  
  private

    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      params[:movie_id].present? ? @movie = Movie.friendly.find(params[:movie_id]) : @movie = Movie.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(
        :title,
        :duration,
        :synopsis,
        :year,
        {categories: []}
      )
    end
end
