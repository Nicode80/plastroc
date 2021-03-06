// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
require("@rails/actiontext")

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
import { slidingCard } from '../components/sliding_card';
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initAutoFadeAlert } from "../plugins/auto_fade_alert";
import { initFlatpickr} from "../plugins/init_flatpickr";
import { materialSelect } from "../components/material_select";
import { initSweetalert, deleteAlert, completeMissionAlert, impossibleToDeleteAlert, finishCampaignAlert } from '../plugins/init_sweetalert';
import { initMapbox } from "../plugins/init_mapbox";
import { toggleConfirmation } from "../components/confirmation_toggle";
import { filter } from "../components/filter";
import { animatedBar } from "../components/progress_bar";
import { closeModal } from "../components/close_achivement_modal";
import { share } from "../components/share";
import { previewImageOnFileSelect } from "../components/photo_preview";
import { missionChecker } from "../components/mission_checker";



document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initSelect2();
  initAutoFadeAlert();
  initAutocomplete();
  initFlatpickr();
  materialSelect(); // allows to select a material category to pick a material in campaign form
  initMapbox();
  initSweetalert();
  deleteAlert();
  toggleConfirmation();
  slidingCard();
  animatedBar();
  filter();
  completeMissionAlert();
  impossibleToDeleteAlert();
  finishCampaignAlert();
  closeModal();
  share();
  previewImageOnFileSelect();
  missionChecker();
});
