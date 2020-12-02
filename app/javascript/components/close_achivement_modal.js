const closeModal = () => {
  const modalBody = document.querySelector('.achivement-modal');
  if(!modalBody) return
  const closeButton = document.querySelectorAll('.close-modal')
  const modalContainer = document.querySelector('#modal-container');

  closeButton.forEach((button) => {
    button.addEventListener('click', (e) => {
      modalBody.classList.remove('achivement-modal');
      modalBody.style.display = 'none';
      modalContainer.style.display = 'none';
    })
  })
};

export { closeModal }
