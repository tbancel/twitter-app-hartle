$(document).ready(function() {
  logo = {
    el: $('.navbar-fixed-top'),
    timeout: undefined,
    fadeOut: function() {
      clearTimeout( logo.timeout );
      logo.timeout = setTimeout(
        function() {
          logo.el.animate( {opacity: 1} )
        },
        1000
      );
      logo.el.css( {opacity: 0.5} );
    }
  }

  $(window).bind('scroll', logo.fadeOut)


  for( var i = 0; i <= 50; i++) {
    document.body.appendChild(document.createElement('br'));
  }
});
