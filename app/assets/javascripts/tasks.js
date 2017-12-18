var ready;
ready = function () {
    $("[id $= 'address']").each(function(){
        var input = document.getElementById($(this).attr('id'));
        console.log(input);
        autocomplete = new google.maps.places.Autocomplete(input);
    });
    $(document).on("fields_added.nested_form_fields", function(event, param) {
        console.log('input');
        var id = "task_locations_attributes_"+param.added_index+"_address";
        var input = document.getElementById(id);
        console.log(input);
        autocomplete = new google.maps.places.Autocomplete(input);

    });

    //
    function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            $('#attachment_preview').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#attachment").change(function() {
    readURL(this);
});
};

jQuery(document).ready(ready);
$(document).on('turbolinks:load', ready);