// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require gmaps/google
//= require bootstrap
//= require_tree .

// $(document).ready(function () {
//   updateVan(20, -20, 'left', 'down');
//   function updateVan(x, y, x_axis, y_axis)
//   {
//     var t = setTimeout(function () {
//       document.getElementById("george").style.backgroundPosition = x + "px " + y + "px";
//       if (x == 0) x_axis = 'right';
//       if (x == -100) x_axis = 'left';
//       if (y == 0) y_axis = 'up';
//       if (y == -100) y_axis = 'down';
//       if(x_axis == 'left')
//         x-=1;
//       else
//         x+=1;
//
//       if(y_axis == 'up')
//         y-=1;
//       else
//         y+=1;
//
//       updateVan(x, y, x_axis, y_axis);
//     },50);
//   }
// });
