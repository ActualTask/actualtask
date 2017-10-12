var ready;
ready = function () {
    var input = document.getElementById('info_address');
    if(input!==null)autocomplete = new google.maps.places.Autocomplete(input);
};
jQuery(document).ready(ready);
$(document).on('turbolinks:load', ready);
