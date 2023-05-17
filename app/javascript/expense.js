$(function(){
  $('form').on('input', '.price, .quantity', function() {
    // 各行の小計を計算する
    var price = Number($(this).closest('.nested-fields').find('.price').val());
    var quantity = Number($(this).closest('.nested-fields').find('.quantity').val());
    var subtotal = price * quantity;

    // 小計を表示する
    $(this).closest('.nested-fields').find('.subtotal').val(subtotal);

    // 全ての小計の合計を計算する
    var total = 0;
    $('.subtotal').each(function(){
      total += Number($(this).val());
    });

    // 総額を表示する
    $('#total').val(total);
  });
});
