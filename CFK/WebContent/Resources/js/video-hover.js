var $videostar = $('.videostar');

$videostar.on('mouseenter focus',function(){
	$videostar.get(0).play();
});

$videostar.on('mouseout blur',function(){
	$videostar.get(0).pause();
});