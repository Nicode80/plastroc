import flatpickr from "flatpickr"

const initFlatpickr = () => {

  const datePicker = document.querySelector('.date-picker');

  if (datePicker) {
    flatpickr(".date-picker", {
      minDate: "today"
    })
  }
}

export { initFlatpickr }
