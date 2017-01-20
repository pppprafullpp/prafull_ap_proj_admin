// JavaScript Document


$(document).ready(function(){
    resizeContent();

    $(window).resize(function() {
        resizeContent();
    });

    $(window).on("scroll",function() {
        resizeContent();
    });
});

function resizeContent() {
    $height = $(window).height()+ window.pageYOffset;
		// if ($height < 850){
		$('.sidebar').height($height-50);
		// }

}
