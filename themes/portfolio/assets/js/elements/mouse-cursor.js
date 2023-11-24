$(document).ready(function()
{

    if(getOrientation() == 'portrait')
    {
        mouseCursor.css('display', 'none');
    }


    let mouseCursor = $(".mouse-cursor");
    let square = $(".square");
    let sticky = false;

    $(document).on('mouseenter', '.cursor-pointer', function()
    {
        let type = $(this).data('type');
        let svg, top, left, width, height, border_radius;

        mouseCursor.addClass('active');

        switch (type)
        {
            case 'link':
                mouseCursor.addClass('link');
            break;
            case 'image' : 
                mouseCursor.addClass('image');
            break;
            case 'button' : 
                mouseCursor.addClass('button');
            break;
            case 'sticky' : 
                mouseCursor.addClass('sticky');
                sticky = true;
                svg = $(this).find('svg');

                top = svg.offset().top - $(window).scrollTop() - svg.height() / 2 ;
                left = svg.offset().left - $(window).scrollLeft() - svg.width() / 2;
                width = svg.width() * 2;
                height = svg.height() * 2;

                mouseCursor.css({
                    top: top,
                    left: left,
                    width: width,
                    height: height,
                });


                
            break;
        }


        
    });
    $(document).on('mouseleave', '.cursor-pointer', function(e)
    {
        
        sticky = false;
        mouseCursor.removeClass('active');
        mouseCursor.removeClass('link');
        mouseCursor.removeClass('image');
        mouseCursor.removeClass('button');
        mouseCursor.removeClass('header');
        mouseCursor.removeClass('sticky');
        mouseCursor.css({
            width: 40,
            height: 40,
        });
        
    });

    $(window).on('mousemove', function(e)
    {
        if(!sticky)
        {
            mouseCursor.css({
                top: e.clientY - mouseCursor.height() / 2,
                left: e.clientX - mouseCursor.width() / 2
            });
        }
    });



});