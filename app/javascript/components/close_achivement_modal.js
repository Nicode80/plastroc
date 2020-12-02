const closeModal = () => {
  const closeButton = document.querySelector('#close-modal')
  if(!closeButton) return

  const modalBody = document.querySelector('.achivement-modal');
  const modalContainer = document.querySelector('#modal-container');

  // modalBody.onclick = function(e) {
  //   if(e.target != document.getElementById('content-area')) {
  //       console.log('You clicked outside');
  //   } else {
  //       console.log('You clicked inside');
  //   }
  // }

  closeButton.addEventListener('click', (e) => {
    modalBody.classList.remove('achivement-modal');
    modalBody.style.display = 'none';
    modalContainer.style.display = 'none';
  })
};

export { closeModal }
