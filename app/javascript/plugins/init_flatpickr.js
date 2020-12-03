import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {

  const datePicker = document.querySelector('.date-picker');
  const editDatePicker = document.querySelector('.edit-date-picker');

  if (datePicker) {
    flatpickr(".date-picker", {
      minDate: "today",
      dateFormat: "d/m/Y",
      disableMobile: true,
      "plugins": [new rangePlugin({ input: "#secondRangeInput"})]
    });
  }
  if (editDatePicker) {
    flatpickr(".edit-date-picker", {
      minDate: "today",
      dateFormat: "d/m/Y",
      disableMobile: true
    });
  }
}

export { initFlatpickr }
