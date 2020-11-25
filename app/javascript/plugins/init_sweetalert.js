import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const elements = document.querySelectorAll(selector);
  elements.forEach((swalButton) => {
    if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
        console.log(event.target.dataset.id);
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
        if (swalButton) { // protect other pages
            swalButton.addEventListener('click', () => {
                const organisationId = event.target.dataset.id

                swal({
                    title: "Delete",
                    text: "Are you sure you want to delete organisation ?",
                    icon: "error"
                }).then((value) => {
                    console.log(value)
                    if (value) {
                        document.getElementById(`del-org-${organisationId}`).click()
                    };
                });
            })
        }
    })
};

export { initSweetalert, deleteAlert };
