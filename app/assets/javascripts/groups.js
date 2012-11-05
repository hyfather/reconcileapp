$(document).ready(function() {
  $("td.amount").tooltip({
    'trigger' : 'hover',
    'placement' : 'left'
  });

  $("td.category").tooltip({
    'trigger' : 'hover',
    'placement' : 'left'
  });

  $("td").tooltip({
    'trigger' : 'hover',
    'placement' : 'right'
  });

  $("th").tooltip({
    'trigger' : 'hover',
    'placement' : 'top'
  });

  $(".group_form input").tooltip({
    'trigger' : 'focus',
    'placement' : 'right'
  });
  $(".group_form textarea").tooltip({
    'trigger' : 'focus',
    'placement' : 'right'
  });

  $("a.dashboard-amount-button").popover({
      'trigger' : 'hover',
      'placement' : 'right'
    });
});
