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
};

jQuery(document).ready(ready);
$(document).on('turbolinks:load', ready);