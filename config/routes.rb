Rails.application.routes.draw do
  resources :gardens do
    resources :plants, only: [:create] do

    end
  end

  resources :plants, only: [:destroy] do
    # We nest if we need to know id for the parent
    # when generating the form and receiving the form submission

    # e.g. The user will click on a link over the plant card to add a tag.
    # This means that the user already chose the plant he wants to tag.
    # Because of that we need to know, somehow, which plant he chose.
    # The best way to keep track of this is to add the plant_id on the url
    # so we can retrieve it inside our PlantTags Controller.
    # We will need to know the plant to build/generate the form in the new.html.erb
    # and to assing the correct Plant to the new PlantTag we will create.
    resources :plant_tags, only: [:new, :create]
  end
end
