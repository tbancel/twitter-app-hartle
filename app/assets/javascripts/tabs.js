$(document).ready(function() {
  view = $(".tabs_fade .tabs_view");
  tabs = $(".tabs_fade .tab_fade");
  tab_buttons = $(".tabs_fade .tab_button");
  cursor = $(".tabs_fade .tab_cursor");

  tab_buttons.each(function(index, el) {
    $(el).bind('click', function(evnt) {
      view.fadeOut(function() {
        tabs.css({display: 'none'});
        $(tabs[index]).css({display: 'block'});
      });
      left = $(el).css('left');
      cursor.animate({left: left});
      view.fadeIn();
    });
  });
});
