const toggleConfirmation = () => {
  const checkbox = document.querySelector('#confirm');
  const checkList = document.querySelector('#engagements');
  const checkItems = document.querySelectorAll('#engagements li');
  const btn = document.querySelector('#btn-confirm');

  if(!checkbox) return;
  btn.disabled = true;

  checkbox.addEventListener('change', (e) => {
    if(e.target.checked) {
      btn.classList.toggle('disabled');
      btn.disabled = false;
      checkList.style.listStyle = 'none';
      checkItems.forEach(item => {
        item.classList.add('icon', 'check-green');
      });
    } else {
      btn.classList.toggle('disabled');
      btn.disabled = true;
      checkList.style.listStyle = '';
      checkItems.forEach(item => {
        item.classList.remove('icon', 'check-green');
      });
    }
  });
};

export { toggleConfirmation }
