$("#target").submit(function( event ) {
  var hash = md5($("#secret").val())
  if (hash == "3758002ab24653af8d550c0c50473098") {
  	var encode = "ÐßÏ½æ¦ ÐÞÙÖ©Ã»¤× ÃºªîÈ©¼×ÐÖËÕ§£¢Íç«ÖÉÌ±ÈÕÒßÊÕÅ"
	var newstr = ""
	var key = $("#secret").val()
	for (var i = 0; i < encode.length; i++) {
		newstr += String.fromCharCode(encode.charCodeAt(i) - key.charCodeAt(i%key.length))
	}
  	window.location = "/f" + newstr
  }

  $("#secret").val("")
  event.preventDefault();
});

