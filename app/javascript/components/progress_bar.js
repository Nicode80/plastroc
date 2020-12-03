const animatedBar = () => {
  const progressEngagedBar = document.getElementById("myEngagedBar");
  const progressDoneBar = document.getElementById("myDoneBar");
  // const progressBarContent = document.getElementById("myBar");
  if(!progressDoneBar) return;

    if(document.querySelector('#volume_done')) {
      const volumeDone = parseInt(document.querySelector('#volume_done').dataset.total, 10);
      let width = 0;

      let idDone = setInterval(() => {
      if (width >= volumeDone) {
        clearInterval(idDone);
      } else {
        width++;
        progressDoneBar.style.width = width + "%";
        if (width > 5) {
          progressDoneBar.innerHTML = width  + "%";
        } else {
          progressDoneBar.innerHTML = "...";
        }
      }
    }, 10);
    }

    if(!progressEngagedBar) return;

    if(document.querySelector('#volume_engaged')) {
      const volumeEngaged = parseInt(document.querySelector('#volume_engaged').dataset.total, 10);
      let width = 0;

      let idEngaged = setInterval(() => {
        if (width >= volumeEngaged) {
          clearInterval(idEngaged);
        } else {
          width++;
          progressEngagedBar.style.width = width + "%";
          if (width > 5) {
            progressEngagedBar.innerHTML = width  + "%";
          } else {
            progressEngagedBar.innerHTML = "...";
          }
        }
      }, 10);
    }
};

export { animatedBar }
