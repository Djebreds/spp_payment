# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.min.js"
pin_all_from "app/javascript/theme", under: "theme", preload: true
pin "select2", to: "https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"
pin_all_from "app/javascript/plugins", under: "plugins", preload: true
pin "categoriesDataTable", to: "app/javascript/pages/categories/categoriesDataTable.js"