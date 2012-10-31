$(document).ready(function() {
  $("td.amount").tooltip({
    'trigger' : 'hover',
    'placement' : 'left'
  });

  $("td").tooltip({
    'trigger' : 'hover',
    'placement' : 'right'
  });
});
