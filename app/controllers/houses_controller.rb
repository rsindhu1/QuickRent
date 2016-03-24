class HousesController < ApplicationController

  def house_params
    params.require(:house).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve house ID from URI route
    @house = House.find(id) # look up house by unique ID
    # will render app/views/houses/show.<extension> by default
  end

  def index
#    @houses = House.all

#        sort = params[:sort] 
#      case sort
#      when  'title'
#        ordering,@title_header = :title, 'hilite'
#        when 'release_date'
#          ordering,@release_date_header = :release_date, 'hilite'
#        
#      end
#    @houses = House.order(ordering)
#    @all_areas = House.ratings.inject(Hash.new) do |all_areas, rating|
#          all_areas[rating] = @ratings.nil? ? false : @ratings.has_key?(rating) 
#          all_areas
#       end 


    @all_areas = House.ratings
    @area_selection = params[:ratings] || session[:ratings] || {}
    if @area_selection == {} then
      House.ratings.each do |r|
        @area_selection[r] = 1
      end
    end
    @sort_param = params[:sort_by] || session[:sort_by]
    if @sort_param == 'title' then @title_header = 'hilite'
      elsif @sort_param == 'release_date' then @release_date_header = 'hilite'
    end
    if session[:ratings] != params[:ratings] or session[:sort_by] != params[:sort_by]
      session[:ratings] = params[:ratings]
      session[:sort_by] = params[:sort_by]
      redirect_to :sort_by => @sort_param, :ratings => @area_selection
    end
    @houses = House.where(rating: @area_selection.keys).order(@sort_param)

  end

  def new
    # default: render 'new' template
  end
  
  helper_method :login
  def login
    "Hello!"
  end

  def create
    @house = House.create!(house_params)
    flash[:notice] = "#{@house.title} was successfully created."
    redirect_to houses_path
  end

  def edit
    @house = House.find params[:id]
  end

  def update
    @house = House.find params[:id]
    @house.update_attributes!(house_params)
    flash[:notice] = "#{@house.title} was successfully updated."
    redirect_to house_path(@house)
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy
    flash[:notice] = "House '#{@house.title}' deleted."
    redirect_to houses_path
  end

end