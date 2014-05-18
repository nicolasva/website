id_last_form_photo = parseInt($(".annoncment_photos_photo").children().last().attr("id").split("_").slice(-2)[0])
id_last_form_photo_sup = ++id_last_form_photo
$(".annoncment_photos").append("<div class='row'>
  <div class='col-md-6'>
    <div class='form-group hidden annoncment_photos_uuid'>
      <input id='annoncment_photos_attributes_"+id_last_form_photo_sup.toString()+"_uuid' class='hidden form-control' type='hidden' value='0' name='annoncment[photos_attributes]["+id_last_form_photo_sup.toString()+"][uuid]'>
    </div>
    <div class='form-group file optional annoncment_photos_photo'>
      <label class='file optional' for='annoncment_photos_attributes_"+id_last_form_photo_sup.toString()+"_photo'>
        Photo
      </label>
      <input id='annoncment_photos_attributes_"+id_last_form_photo_sup.toString()+"_photo' class='file optional form-control' type='file' name='annoncment[photos_attributes]["+id_last_form_photo_sup.toString()+"][photo]'>
    </div>
  </div>
  <div class='col-md-6'>
    <div class='row'> Master image ? </div>
    <div class='row'>
      <input id='annoncment_photos_master_master_image__"+id_last_form_photo_sup.toString()+"' type='radio' value='"+id_last_form_photo_sup.toString()+"' name='annoncment[photos_master][master_image][]'>
    </div>
  </div>"
)
