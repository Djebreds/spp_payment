// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
// import 'controllers';
import 'jquery';
import 'select2';
import 'plugins/datatables';
import 'plugins/sweetalert';
import 'theme/theme';

$('.form-select').select2({
  placeholder: 'Silahkan pilih',
  theme: 'bootstrap4',
});
