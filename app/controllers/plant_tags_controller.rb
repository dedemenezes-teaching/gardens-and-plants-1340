class PlantTagsController < ApplicationController
  def new
    # raise
    # RETRIEVE THE CORRECT PLANT
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    # we are now creating multiple PlantTags
    # To see the previous version, creating only one PlantTag at a time ⤵️
    # https://github.com/dedemenezes/gardens-and-plants-1340/blob/32a87825a0572483c96789373e7564f7cb7454b1/app/controllers/plant_tags_controller.rb#L9

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
end
