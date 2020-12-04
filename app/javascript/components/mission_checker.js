const missionChecker = () => {
  const codeInput = document.querySelector('#validation-code-input');
  if(!codeInput) return;

  const code = document.querySelector('#code-form').dataset.code;
  const form = document.querySelector('#code-form');
  const check = document.querySelector('#submit-code');
  const error = document.querySelector('#code-invalid');
  const btn = document.querySelector('#complete-cta');
  const valid = document.querySelector('#valid-tick');
  const invalid = document.querySelector('#invalid-tick');
  btn.disable = true;

  check.addEventListener('click', (e) => {
    if(codeInput.value != code) {
      if(error.className == 'd-none'){
        error.classList.toggle('d-none');
      }
      if(valid.className == 'fa fa-check-circle') {
        valid.classList.toggle('d-none');
      }
      codeInput.style.border = "2px solid red";
      invalid.classList.toggle('d-none');
    } else {
      if(error.className == ''){
        error.classList.toggle('d-none');
      }
      if(invalid.className = 'fas fa-exclamation-circle') {
        invalid.classList.toggle('d-none');
      }
      codeInput.style.border = "2px solid #00CD60";
      valid.classList.toggle('d-none');
      btn.disable = true;
      btn.classList.remove('disabled');
      }
  });

}

export { missionChecker }
