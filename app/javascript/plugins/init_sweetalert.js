import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const elements = document.querySelectorAll(selector);
  elements.forEach((swalButton) => {
    if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
        options.value = event.target.dataset.id
        swal.setActionValue({
            confirm: event.target.dataset.id
        })

        swal(options).then(callback);
    });
    }
  })
};

const deleteAlert = () => {
  const elements = document.querySelectorAll(".delete-organisation");
  elements.forEach((swalButton) => {
    if (swalButton) {
      swalButton.addEventListener('click', () => {
        const organisationId = event.target.dataset.id

        swal({
            title: "Supprimer Organisation",
            text: "Êtes-vous sûr ?",
            icon: "warning",
            buttons: ["Oh nooon!", "Ooh ouiii!"],
        }).then((value) => {
          if (value) {
              document.getElementById(`del-org-${organisationId}`).click()
          };
        });
      })
    }
  })
};

const completeMissionAlert = () => {
  const elements = document.querySelectorAll(".complete-mission");
  elements.forEach((swalButton) => {
    if (swalButton) {
      swalButton.addEventListener('click', () => {
        swal({
            title: "Terminer la mission",
            text: "Êtes-vous sûr ?",
            icon: "success",
            buttons: ["Oh nooon!", "Ooh ouiii!"],
        }).then((value) => {
          if (value) {
            document.getElementById('complete-cta').click()
          };
        });
      })
    }
  })
};


const impossibleToDeleteAlert = () => {
  initSweetalert('.impossible-to-delete-organisation', {
    title: "Oooops",
    text: "Désolé vous ne pouvez pas supprimer une organisation qui a des campagnes en cours.",
    icon: "warning"
  }, (value) => {
    nil;
  });
}


export { initSweetalert, deleteAlert, completeMissionAlert, impossibleToDeleteAlert };
