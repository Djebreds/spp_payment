import Swal from 'sweetalert2';
import * as sweetalert2 from 'sweetalert2';

window.addEventListener('turbo:load', () => {
  document.addEventListener('submit', (event) => {
    if (event.target && event.target.className === 'button_to') {
      event.preventDefault();
      Swal.fire({
        title: 'Apakah anda ingin menghapus?',
        showCancelButton: true,
      })
        .then((result) => {
          if (result.isConfirmed) {
            document.querySelector('.button_to').submit();
          }
        })
        .catch(event.preventDefault());
    }
  });
});
