var body = $('body');
var header = $('header');
var last_projects_status = true;


// On document load
$(window).on('load', function()
{
    $(window).scrollTop(0);

    setTimeout(function(){
        let preloader = $('aside.preloader');
        let delimiter = $('aside.preloader .delimiter');
        delimiter.remove();
        preloader.addClass('loaded');
        body.css('overflow-y', 'auto');
    }, 1000);

    setTimeout(function(){
        
        $("#home .title").addClass('active');
        $("#home .subtitle").addClass('active');
        $("#home .scroll-down").addClass('active');
        header.addClass('active');
    }, 1500);

});

$(document).ready(function()
{

    $(document).on('click', ".link-href", function()
    {
        let preloader = $('aside.preloader');
        let src = $(this).data('src');
        preloader.removeClass('loaded');
        setTimeout(function(){
            window.location.href = src;
        }, 600);

    });


    if(getOrientation() == 'landscape') {
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
    }

    
    


});

function getOrientation()
{
    if(window.innerHeight > window.innerWidth) {
        return 'portrait';
    } else {
        return 'landscape';
    }
}

