const initAutoFadeAlert = () => {
  const alert = document.querySelector('.alert')
  if (!alert) return;

  $(".alert").fadeOut(3000);
}

export { initAutoFadeAlert }
