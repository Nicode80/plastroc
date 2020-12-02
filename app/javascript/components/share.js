const share = () => {
  const shareButton = document.querySelector('#share-achivement');
  if(!shareButton) return

  const data = {
      title: 'Plastroc',
      text: 'Il est trop tard pour être pessimiste',
      url: 'https://www.plastroc.com/',
    }

  shareButton.addEventListener('click', (e) => {
    navigator.share(data);
  });
}

export { share }
