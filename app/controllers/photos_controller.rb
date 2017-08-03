class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)

    if @photo.valid?
      flash[:success] = "Photo posted."
    else
      flash[:error] = "Error: #{@photo.errors.full_messages.to_sentence}"
    end

    redirect_to root_path
  end

  def destroy
    puts "PARAMS #{params}"
    Photo.find(params[:id].to_i).destroy
    
    redirect_to root_path
  end

  def edit
    @photo = Photo.find(params[:id])
    render 'new'
  end

  def photo_params
    params.require(:photo).permit(:username, :url)
  end

  def update
    puts "PARAMS #{params}"
    photo = Photo.find(params[:id])
    photo.update(photo_params)

    # puts new_name = params[:photo][:username]
    # puts new_url = params[:photo][:url] 
    # puts target_id = params[:id].to_i
    # update_photo = Photo.find(target_id)
    # puts update_photo.username = new_name
    #puts update_photo.url = new_url
    photo.save

    redirect_to root_path
  end


end
