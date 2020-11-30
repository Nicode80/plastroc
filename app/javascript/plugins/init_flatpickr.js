import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {

  const datePicker = document.querySelector('.date-picker');

  if (datePicker) {
    flatpickr(".date-picker", {
      minDate: "today",
      dateFormat: "d/m/Y",
      "plugins": [new rangePlugin({ input: "#secondRangeInput"})]
    })
  }
}

export { initFlatpickr }
