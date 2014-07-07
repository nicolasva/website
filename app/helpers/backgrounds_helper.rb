module BackgroundsHelper
  def collection_opacity
    array_collection_opacity = Array.new
    cpt = 0
    array_collection_opacity.push(cpt)
    while cpt <= 1
      array_collection_opacity.push(cpt.round(1)) 
      cpt += 0.1
    end
    return array_collection_opacity
  end
end
