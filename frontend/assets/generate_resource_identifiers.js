$(function () {

  var padding = 3;

  var pad_number = function (number, padding) {
    var s = ('' + number);

    var padding_needed = (padding - s.length)

    if (padding_needed > 0) {
      s = (new Array(padding_needed + 1).join("0") + s);
    }

    return s;
  };


  var generate_resource_id = function () {
    $.ajax({
      url: APP_PATH + "plugins/generate_resource_identifier/generate",
      data: {},
      type: "POST",
      success: function(identifier) {
        identifier_number = pad_number(identifier.number, padding);
        $('#resource_id_0_').val("#{identifier.year}#{identifier_number}");
        //$('#resource_id_1_').val(pad_number(identifier.number, padding));

        $('#resource_id_1_').enable();
      },
    })
  };


  var identifier_is_blank = function () {
    for (var i = 0; i < 4; i++) {
      if ($("#resource_id_" + i + "_").val() !== "") {
        return false;
      }
    }

    return true;
  };



  if (identifier_is_blank()) {
    generate_resource_id();
  }

})

