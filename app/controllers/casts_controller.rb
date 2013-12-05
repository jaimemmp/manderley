class CastsController < ApplicationController
    before_action :set_movie, except: [:show, :edit, :update, :destroy]

    def index
        @cast = @movie.cast
    end

    def new
        @cast = @movie.casts.build
    end

    def show
    end

    def edit
        @cast = Cast.find(params[:id])
    end

    def create
        @cast = @movie.casts.build(cast_params)
        respond_to do |format|
          if @cast.save
            format.html { redirect_to movie_path(@cast), notice: 'Person was successfully created.' }
            format.json { render action: 'show', status: :created, location: @cast }
          else
            format.html { render action: 'new' }
            format.json { render json: movie_path(@cast).errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        @cast = Cast.find(params[:id])
        respond_to do |format|
          if @cast.update(cast_params)
            format.html { redirect_to movie_path(@cast), notice: 'Person was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: movie_path(@cast).errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @cast = Cast.find(params[:id])
        @cast.destroy
        respond_to do |format|
          format.html { redirect_to movie_path(@cast) }
          format.json { head :no_content }
        end
    end

    private
    def set_movie
        @movie = Movie.find(params[:movie_id])
    end

    def cast_params
        params.require(:cast).permit(:name, :role)
    end

end