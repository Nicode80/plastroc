import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('address-for-autocomplete');
  if (!addressInput) return;

  places({ container: addressInput });

};

export { initAutocomplete };
