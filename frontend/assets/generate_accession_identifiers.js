$(function () {

  var generate_accession_id = function () {
    var tmp = APP_PATH + "plugins/generate_accession_identifier/generate";
    console.log("URL2: " + tmp);

    $.ajax({
      //url: APP_PATH + "plugins/generate_accession_identifier/generate",
      url: "/plugins/generate_accession_identifier/generate",
      data: {},
      type: "POST",
      success: function(identifier) {
        $('#accession_id_0_').val(identifier.number);

        $('#accession_id_1_').enable();
      },
    })
  };


  var identifier_is_blank = function () {
    for (var i = 0; i < 4; i++) {
      if ($("#accession_id_" + i + "_").val() !== "") {
        return false;
      }
    }

    return true;
  };



  if (identifier_is_blank()) {
    generate_accession_id();
  }

})

