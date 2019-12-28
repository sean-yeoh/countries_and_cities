require("select2")

$(document).ready(function() {
  $('[data-country-select]').select2();
  $('[data-city-select]').select2();

  $('[data-country-select]').change(function() {
    var country = $(this).val()
    $.ajax({
      url: '/ajax/cities?country=' + country
    }).done(function(data) {

      $('[data-city-select]').select2('destroy').empty()
      $('[data-city-select]').select2({
        data: data
      });

      canSubmit()
    })
  })

  $('[data-city-select]').change(function() {
    canSubmit()
  })

  function canSubmit() {
    var form = $('[data-country-and-city-form]')
    var submitBtn = form.find('input[type="submit"]')
    submitBtn.attr('disabled', ($('[data-country-select]').val().length < 1 || $('[data-city-select]').val().length < 1))
  }
});
