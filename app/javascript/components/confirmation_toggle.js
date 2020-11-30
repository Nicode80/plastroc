const toggleConfirmation = () => {
  const checkbox = document.querySelector('#confirm');
  const checkList = document.querySelector('#engagements');
  const chekItems = document.querySelectorAll('#engagements li');
  const btn = document.querySelector('#btn-confirm');
  btn.disabled = true;
  // const checkQuantity = document.querySelector('#check-quantity');
  // const checkMaterial = document.querySelector('#check-material');
  // const checkDeadline = document.querySelector('#check-deadline');
  // const checkStatus = document.querySelector('#check-status');

  if(!checkbox) return;


  checkbox.addEventListener('change', (e) => {
    if(e.target.checked) {
      btn.classList.toggle('disabled');
      btn.disabled = false;
      checkList.style.listStyle = 'none';
      chekItems.forEach(item => {
        item.classList.add('icon', 'check-green');
      });
    } else {
      btn.classList.toggle('disabled');
      btn.disabled = true;
      checkList.style.listStyle = '';
      chekItems.forEach(item => {
        item.classList.remove('icon', 'check-green');
      });
    }
  });

  // checkQuantity.addEventListener('change', (e) => {
  //   if(e.target.checked) {
  //     checkMaterial.addEventListener('change', (e) => {
  //         if(e.target.checked) {
  //           checkDeadline.addEventListener('change', (e) => {
  //               if(e.target.checked) {
  //                 checkStatus.addEventListener('change', (e) => {
  //                     if(e.target.checked) {
  //                       button.classList.remove('disabled');
  //                     } else {
  //                         button.classList.add('disabled');
  //                       }
  //                   });
  //               } else {
  //                   button.classList.add('disabled');
  //                 }
  //             });
  //         } else {
  //           button.classList.add('disabled');
  //         }
  //       });
  //   } else {
  //     button.classList.add('disabled');
  //   }
  // });



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

//

export { toggleConfirmation }
