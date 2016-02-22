class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
#    @movies = Movie.all

#        sort = params[:sort] 
#      case sort
#      when  'title'
#        ordering,@title_header = :title, 'hilite'
#        when 'release_date'
#          ordering,@release_date_header = :release_date, 'hilite'
#        
#      end
#    @movies = Movie.order(ordering)
#    @all_ratings = Movie.ratings.inject(Hash.new) do |all_ratings, rating|
#          all_ratings[rating] = @ratings.nil? ? false : @ratings.has_key?(rating) 
#          all_ratings
#       end 


    @all_ratings = Movie.ratings
    @rating_selection = params[:ratings] || session[:ratings] || {}
    if @rating_selection == {} then
      Movie.ratings.each do |r|
        @rating_selection[r] = 1
      end
    end
    @sort_param = params[:sort_by] || session[:sort_by]
    if @sort_param == 'title' then @title_header = 'hilite'
      elsif @sort_param == 'release_date' then @release_date_header = 'hilite'
    end
    if session[:ratings] != params[:ratings] or session[:sort_by] != params[:sort_by]
      session[:ratings] = params[:ratings]
      session[:sort_by] = params[:sort_by]
      redirect_to :sort_by => @sort_param, :ratings => @rating_selection
    end
    @movies = Movie.where(rating: @rating_selection.keys).order(@sort_param)

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
