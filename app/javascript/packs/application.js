// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'materialize-css/dist/js/materialize'

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "client/dynamic.js"
// import "client/language.js"
Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', function () {
  M.updateTextFields();

  let elems = document.querySelectorAll('.materialize-textarea')
  if (elems.length) {
    elems.forEach(elem => M.textareaAutoResize(elem))
  }
})
