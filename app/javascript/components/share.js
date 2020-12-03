const share = () => {
  const shareButton = document.querySelector('#share-achivement');
  if(!shareButton) return
    const modalBody = document.querySelector('.achivement-modal');
    const modalContainer = document.querySelector('#modal-container');

  const data = {
      title: 'Plastroc',
      text: 'Il est trop tard pour être pessimiste',
      url: 'https://www.plastroc.com/',
    }

  shareButton.addEventListener('click', (e) => {
    navigator.share(data);
    setTimeout(closeModal, 10000);
  });

  const closeModal = () => {
    modalBody.classList.remove('achivement-modal');
    modalBody.style.display = 'none';
    modalContainer.style.display = 'none';
  }
}

export { share }
