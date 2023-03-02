import Swal from 'sweetalert2';
import * as sweetalert2 from 'sweetalert2';

const swalWithBootstrapButtons = Swal.mixin({
  customClass: {
    confirmButton: 'btn btn-danger mx-2',
    cancelButton: 'btn btn-dark mx-2',
  },
  buttonsStyling: false,
});
