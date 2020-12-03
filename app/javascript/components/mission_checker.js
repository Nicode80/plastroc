const missionChecker = () => {
  const codeInput = document.querySelector('#validation-code-input');
  if(!codeInput) return;

  const code = document.querySelector('#code-form').dataset.code;
  const form = document.querySelector('#code-form');
  const check = document.querySelector('#submit-code');
  const error = document.querySelector('#code-invalid');
  const btn = document.querySelector('#complete-cta');
  btn.disable = true;

  check.addEventListener('click', (e) => {
    if(codeInput.value != code) {
      error.classList.toggle('d-none');
      codeInput.style.border = "2px solid red";
    } else {
      error.classList.toggle('d-none');
      codeInput.style.border = "2px solid #00CD60";
      btn.disable = true;
      btn.classList.remove('disabled');
      }
  });

}

export { missionChecker }
