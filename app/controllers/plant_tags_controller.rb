class PlantTagsController < ApplicationController
  def new
    # raise
    # RETRIEVE THE CORRECT PLANT
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    # raise
    @plant = Plant.find(params[:plant_id])
    # retrieve all the tags that the user submitted
    @tags = Tag.where(id: params[:plant_tag][:tag])
    # for each tag
    @tags.each do |tag|
      # create the new plant_tag
      plant_tag = PlantTag.new(tag: tag, plant: @plant)
      plant_tag.save
    end

    redirect_to garden_path(@plant.garden)
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end
end
