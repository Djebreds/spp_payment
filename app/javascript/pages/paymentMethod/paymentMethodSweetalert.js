import Swal from 'sweetalert2';
import * as sweetalert2 from 'sweetalert2';

document.querySelectorAll('.payment-method').forEach((el) => {
  el.addEventListener('click', function (e) {
    e.preventDefault();
    e.stopImmediatePropagation();
    var id = e.target.getAttribute('data-payment-method-id');
    console.log(id);
    confirmDelete(id);
  });
});

function confirmDelete(id) {
  var form = $('#delete-payment-method-' + id);
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
