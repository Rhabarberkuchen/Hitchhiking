// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require leaflet
//= require jquery3
//= require popper
//= require rails-ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

// Javascript für Uploader
document.getElementById("simple_post_pictures").onchange = upload_picture() {
    document.getElementById("uploadFile").value = this.value;
};

document.getElementById("user_avatar").onchange = upload_picture() {
    document.getElementById("uploadFile").value = this.value;
};
