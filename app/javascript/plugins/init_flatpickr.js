import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {

  const datePicker = document.querySelector('.date-picker');

  if (datePicker) {
    flatpickr(".date-picker", {
      minDate: "today",
      // mode: "range",
      dateFormat: "d/m/Y"
    })
  }
}

export { initFlatpickr }
