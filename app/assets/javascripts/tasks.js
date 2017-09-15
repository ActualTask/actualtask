$(document).ready(function(){
    $("[id $= 'address']").each(function(){
        var input = document.getElementById($(this).attr('id'));
        autocomplete = new google.maps.places.Autocomplete(input);
    });
    $(document).on("fields_added.nested_form_fields", function(event, param) {
        var id = "task_locations_attributes_"+param.added_index+"_address";
        var input = document.getElementById(id);
        autocomplete = new google.maps.places.Autocomplete(input);
    });
});
