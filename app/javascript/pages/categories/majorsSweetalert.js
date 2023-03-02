import Swal from 'sweetalert2';
import * as sweetalert2 from 'sweetalert2';

// window.addEventListener('turbo:load', () => {
// let formId = document.getElementById('delete-major');
// let deleteData = formId.getAttribute('data_test');
// document.addEventListener('submit', (event) => {
//   if (event.target && event.target.getAttribute('data_test') == deleteData) {
//     event.preventDefault();
//     Swal.fire({
//       title: 'Are you sure?',
//       showCancelButton: true,
//     })
//       .then((result) => {
//         if (result.isConfirmed) {
//           document.querySelector('.delete-post').submit();
//         }
//       })
//       .catch(event.preventDefault());
//   }
// });

document.querySelectorAll('.ppp').forEach((el) => {
  el.addEventListener('click', function (e) {
    e.preventDefault();
    e.stopImmediatePropagation();
    var id = e.target.getAttribute('data-major-id');
    console.log(id);
    confirmDelete(id);
  });
});
// });

function confirmDelete(id) {
  var form = $('#delete-major-' + id);
  const swalWithBootstrapButtons = Swal.mixin({
    customClass: {
      confirmButton: 'btn btn-danger mx-2',
      cancelButton: 'btn btn-dark mx-2',
    },
    buttonsStyling: false,
  });

  swalWithBootstrapButtons
    .fire({
      title: 'Apakah anda ingin menghapus data ini?',
      text: 'Jika anda menghapus anda tidak bisa mengembalikan data tersebut.',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'No, cancel!',
      reverseButtons: true,
    })
    .then((result) => {
      if (result.isConfirmed) {
        swalWithBootstrapButtons.fire(
          'Terhapus!',
          'Data berhasil dihapus.',
          'success'
        );
        form.submit();
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        swalWithBootstrapButtons.fire(
          'Dibatalkan',
          'Data tetap tersimpan',
          'error'
        );
      }
    });
}
