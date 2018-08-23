class UserCharactersController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    if params[:status] && !params[:status].empty?
      @user_characters = UserCharacter.where(status: params[:status])
      if @user_characters.empty?
        @message = "No characters found"
      end
    elsif params[:user_character] && !params[:user_character].empty?
      if user_character_params[:location_id]
        @user_characters = UserCharacter.where(location_id: user_character_params[:location_id])
        if @user_characters.empty?
          @message = "No characters found"
        end
      elsif user_character_params[:region_id]
        @user_characters = UserCharacter.find_by_region(user_character_params[:region_id].to_i)
        if @user_characters.empty?
          @message = "No characters found"
        end
      end
    else
      @user_characters = UserCharacter.all
    end
  end

  def show
    @user_character = UserCharacter.find(params[:id])
  end

  def new
    @user_character = UserCharacter.new(character_id: params[:id])
  end

  def create
    @user_character = UserCharacter.new(user_character_params)
    if @user_character.save
      if !params["user_character"]["location"]["name"].empty?
        new_location = Location.create(
          name: params["user_character"]["location"]["name"],
          description: params["user_character"]["description"],
          region: Region.find_by(id: params["user_character"]["location"]["region_id"])
        )
        @user_character.location = new_location
        @user_character.save
      end
      redirect_to user_character_path(@user_character)
    else
      render :new
    end
  end

  def edit
    @user_character = UserCharacter.find(params[:id])
  end

  def update
    @user_character = UserCharacter.find(params[:id])
    if @user_character.update(user_character_params)
      if !params["user_character"]["location"]["name"].empty?
        new_location = Location.create(
          name: user_character_params["location"]["name"],
          description: user_character_params["location"]["description"],
          region: Region.find(user_character_params["location"]["region_id"])
        )
        @user_character.location = new_location
        @user_character.save
      end
      redirect_to user_character_path(@user_character)
    else
      render :edit
    end
  end

  def destroy
    @user_character = UserCharacter.find(params[:id])
    @user_character.destroy
    redirect_to user_characters_path
  end

  private
  def user_character_params
    params.require(:user_character).permit(:character_id, :user_id, :status, :note, :location_id, :region_id, :location, location_attributes: [:name, :description, :region_id])
  end

end
