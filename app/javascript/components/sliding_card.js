const slidingCard = () => {

  const ctaButton = document.getElementById('CTA-join-campaign');
  const arrow = ctaButton.querySelector('.fa-angle-double-up');
  const slidingCard = document.getElementById('sliding-card');
  const bottomText = document.getElementById('bottom-text');
  if(!ctaButton) return;

  ctaButton.addEventListener("click", (event) => {
    slidingCard.classList.toggle("text-open");
    bottomText.classList.toggle("text-open");
    ctaButton.classList.toggle("plastroc-button-sticky-bottom");
    arrow.classList.toggle('rotate-180');
  });
}

export { slidingCard }
