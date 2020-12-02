const filter = () => {
  const checkboxes = document.querySelectorAll('input[type=checkbox]');
  if (!checkboxes) return;

  checkboxes.forEach((checkbox) => {
    const button = document.getElementById('filter-form-button');
    console.log(button);
    checkbox.addEventListener("change", event => {
      console.log("change");
      button.click();
      button.disabled = false;
    });
  });
};

export { filter }
