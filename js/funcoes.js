$('input[name="FlgPontua"]').change(function () {
  if ($('input[name="atacado"]:checked').val() === 1) {
    $('.campos').show();
  } else {
    $('.campos').hide();
  }
});
