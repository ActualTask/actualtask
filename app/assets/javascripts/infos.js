var ready;
ready = function () {
    var input = document.getElementById('info_address');
    if(input!==null)autocomplete = new google.maps.places.Autocomplete(input);
    function readURL(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $('#avatar_preview').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#avatar").change(function() {
        readURL(this);
    });
};
jQuery(document).ready(ready);
$(document).on('turbolinks:load', ready);

