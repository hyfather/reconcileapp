$(document).ready(function() {
  $("td.amount").tooltip({
    'trigger' : 'hover',
    'placement' : 'left'
  });

  $("td").tooltip({
    'trigger' : 'hover',
    'placement' : 'right'
  });

  $(".group_form input").tooltip({
    'trigger' : 'focus',
    'placement' : 'right'
  });
  $(".group_form textarea").tooltip({
    'trigger' : 'focus',
    'placement' : 'right'
  });

});
