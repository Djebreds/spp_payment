import Swal from 'sweetalert2';
import * as sweetalert2 from 'sweetalert2';
function confirmDelete(id) {
  var form = $('#data-id-major' + id);
  const swalWithBootstrapButtons = Swal.mixin({
    customClass: {
      confirmButton: 'btn btn-danger mx-2',
      cancelButton: 'btn btn-dark mx-2',
    },
    buttonsStyling: false,
  });

  swalWithBootstrapButtons
    .fire({
      title: 'kamu yakin?',
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
      } else if (
        /* Read more about handling dismissals below */
        result.dismiss === Swal.DismissReason.cancel
      ) {
        swalWithBootstrapButtons.fire(
          'Dibatalkan',
          'Data tetap tersimpan',
          'error'
        );
      }
    });
}
