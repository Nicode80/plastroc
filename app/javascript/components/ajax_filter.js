import { csrfToken } from '@rails/ujs';

const categoryFilter = () =>
  [...
    document.querySelector('#filter-form')
    .querySelectorAll("input[type='checkbox']:checked")
  ].map(input => input.value)

const ajaxFilter = () => {
  const checkboxes = document.querySelectorAll('input[type=checkbox]');
  if (!checkboxes) return;

  checkboxes.forEach((checkbox) => {
    const button = document.getElementById('filter-form-button');
    checkbox.addEventListener("change", event => {
      button.click();
      button.disabled = false;
    });
  });

  const form = document.getElementById('filter-form');
  form.addEventListener("submit", e => {
    e.preventDefault();
    e.stopPropagation();

    const url = '/campaigns?' + new URLSearchParams({
      category_filter: categoryFilter()
    })
    fetch(url, {
        headers:  {
          "Content-Type": "application/json",
          "Accept": "application/json",
          'X-CSRF-Token': csrfToken()
        }
      })
      .then(response => {
        debugger

        response.json()
      })
      .then((data) => {
        console.log(data);
      });
  });
};

export { ajaxFilter }
