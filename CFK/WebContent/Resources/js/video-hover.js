var $videostar = $('.videostar');

$videostar.on('mouseenter',function(){
	$videostar.popVideo({
        playOnOpen: true,
        title: "jQueryScript.net Demo Page",
      closeOnEnd: true,
        pauseOnClose: true,
    }).open()
});

/*$videostar.on('mouseout',function(){
	$videostar.get(0).load();
});*/



/*$('#video').click(function () {
    $('#video').popVideo({
        playOnOpen: true,
        title: "jQueryScript.net Demo Page",
      closeOnEnd: true,
        pauseOnClose: true,
    }).open()
});*/