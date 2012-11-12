$(document).ready(function() {
  $(".expenses_form input").tooltip({
    'trigger' : 'focus',
    'placement' : 'bottom'
  });
  $("select.category").tooltip({
    'trigger' : 'focus',
    'placement' : 'top'
  });
  $("select").tooltip({
    'trigger' : 'focus',
    'placement' : 'left'
  });
  $("tr.expense").tooltip({
    'trigger' : 'hover',
    'placement' : 'right'
  });

  $("a.settleExpense").click(function(e) {
    e.preventDefault();
    $('#logExpense .modal-header h3').html([
      "How much did",
      $(this).attr("data-payer"),
      "pay you back?"
    ].join(' '));


    settlementButton = $(this);
    expenseForm =  [
      "<div class='input-prepend'><span class='add-on'>",
      settlementButton.attr("data-currency-sign"),
      "</span>",
      '<input class="span1" id="settlement_amount" name="settlement[amount]" placeholder="',
      settlementButton.attr("data-amount"),
      '" size="30" type="text">',
      "</div>"
    ].join('');

    $('#logExpense .modal-body').html(expenseForm);

    $('#logExpense').modal({});
  });
});
