// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { initSelect2 } from '../components/init_select2';
import { initAutocomplete } from "../plugins/init_autocomplete"
import { initAutoFadeAlert } from "../plugins/auto_fade_alert"
import { initFlatpickr} from "../plugins/init_flatpickr"
import { initSweetalert, deleteAlert } from '../plugins/init_sweetalert';
import { initMapbox } from "../plugins/init_mapbox"

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initSelect2();
  initAutoFadeAlert();
  deleteAlert();
});
initAutocomplete();
initFlatpickr();
initMapbox();
initSweetalert('#sweet-alert-demo', {
    title: "A nice alert",
    text: "This is a great alert, isn't it?",
    icon: "success"
}, (value) => {
    console.log(value);
});

initSweetalert('#sweet-alert-demo', {
    title: "A nice alert",
    text: "This is a great alert, isn't it?",
    icon: "success"
}, (value) => {
    console.log(value);
});

initSweetalert('#delete-organisation', {
    title: "Delete",
    text: "Are you sure you want to delete organisation ?",
    icon: "error"
}, (value) => {
    if (value) {
        // const link = document.getElementById('#delete-orga');
        document.getElementById('delete-orga').click()
    }
});
require("trix")
require("@rails/actiontext")
