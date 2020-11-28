const slidingCard = () => {

  const ctaButton = document.getElementById('CTA');
  const slidingCard = document.getElementById('sliding-card');
  const bottomText = document.getElementById('bottom-text');

  ctaButton.addEventListener("click", (event) => {
    slidingCard.classList.toggle("text-open");
    bottomText.classList.toggle("text-open");
    ctaButton.classList.toggle("plastroc-button-sticky-bottom")
  });
}

export { slidingCard }
