$(function(){

	$('.complete').bind('ajax:success', function(evt, data, status, xhr){
		$(this).removeClass('bnt-primary').addClass('btn-success');
	})


})