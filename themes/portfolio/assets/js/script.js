var body = $('body');
var header = $('header');
var last_projects_status = true;

$(document).ready(function()
{

    $('.follow-cursor').mouseenter(function(){

        $(this).mousemove(function(event){
            var deltaX = event.pageX - $(this).offset().left - $(this).outerWidth() / 2;
            var deltaY = event.pageY - $(this).offset().top - $(this).outerHeight() / 2;
            var distance = Math.sqrt(deltaX * deltaX + deltaY * deltaY);

            if(distance < 100) {
                $(this).css({'left': deltaX + 'px', 'top': deltaY + 'px'});
            } else {
                $(this).css({'left': '', 'top': ''});
            }
        });

        

        $(this).mouseleave(function(){
            $(this).off('mousemove');
            $(this).css({'left': '0px', 'top': '0px'});
        });
    });

    $('.follow-cursor').mouseenter(function(){
        var $this = $(this); // Sauvegarde de la référence à $(this)
        $this.css('transform', 'scale(1.2)');
    
        setTimeout(function(){
            $this.css('transform', 'scale(1)');
        }, 100);
    });
    


});

function getOrientation()
{
    if(window.innerHeight > window.innerWidth) {
        return 'portrait';
    } else {
        return 'landscape';
    }
}

