const materialSelect = () => {
  const select = document.querySelector('#campaign_material_category');

  if(select) {
    const materials = JSON.parse(document.querySelector('#materials').dataset.materials);
    const wrapper = document.querySelector('.material-wrapper');

    select.addEventListener('change', (e) => {
      const selectedMaterial = e.currentTarget.value;
      let html = "<p>No material for this category yet</p>";
      if(materials[selectedMaterial]) {
       html = materials[selectedMaterial].map(material => {
          return `
          <span class="radio material-item">
            <input class="radio_buttons required material-selector" type="radio" value="${material.id}" name="campaign[material_id]" id="campaign_material_id_${material.name.toLowerCase()}">
            <label class="collection_radio_buttons" for="campaign_material_id_${material.name.toLowerCase()}">${material.name}</label>
          </span>
          `
        }).join('\n');
      }

      wrapper.innerHTML = `
        <input type="hidden" name="campaign[material_id]" value="">
        ${html}
      `
    });
  }
}

export { materialSelect }

