const toggleConfirmation = () => {
  const button = document.querySelector('#confirm-btn');
  const checkQuantity = document.querySelector('#check-quantity');
  const checkMaterial = document.querySelector('#check-material');
  const checkDeadline = document.querySelector('#check-deadline');
  const checkStatus = document.querySelector('#check-status');

  if(!button) return;

  checkQuantity.addEventListener('change', (e) => {
    if(e.target.checked) {
      checkMaterial.addEventListener('change', (e) => {
          if(e.target.checked) {
            checkDeadline.addEventListener('change', (e) => {
                if(e.target.checked) {
                  checkStatus.addEventListener('change', (e) => {
                      if(e.target.checked) {
                        button.classList.remove('disabled');
                      } else {
                          button.classList.add('disabled');
                        }
                    });
                } else {
                    button.classList.add('disabled');
                  }
              });
          } else {
            button.classList.add('disabled');
          }
        });
    } else {
      button.classList.add('disabled');
    }
  });



  // const checkBoxes = document.querySelectorAll('#confirmation .checkbox input');
  // const button = document.querySelector('#confirm-btn');
  // if(!checkBoxes) return;

  // const confirms = [];

  // checkBoxes.forEach( checkbox => {
  //   checkbox.addEventListener('change', (e) => {
  //     confirms.push(e.target.checked);
  //   });
  // });
  // console.log(confirms);
};

// button.classList.toggle('disabled')

export { toggleConfirmation }
