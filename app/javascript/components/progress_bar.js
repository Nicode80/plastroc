const animatedBar = () => {
  const progressBar = document.getElementById("myBar");

  if(progressBar) {
    const volume = parseInt(document.querySelector('#volume').dataset.total, 10);

    let width = 0;

    let id = setInterval(() => {
      if (width >= volume) {
        clearInterval(id);
      } else {
        width++;
        progressBar.style.width = width + "%";
        progressBar.innerHTML = width  + "%";
      }
    }, 10);
  }
};

export { animatedBar }
