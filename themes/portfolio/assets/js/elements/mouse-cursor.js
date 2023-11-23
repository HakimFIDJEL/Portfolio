$(document).ready(function()
{
    let mouseCursor = $(".mouse-cursor");
    let square = $(".square");
    let sticky = false;

    $(document).on('mouseenter', '.cursor-pointer', function()
    {
        let type = $(this).data('type');

        switch (type)
        {
            case 'link':
                let color = $(this).data('color');
                mouseCursor.addClass('active');
                mouseCursor.css('background-color', color);
            break;
            case 'sticky' : 
                sticky = true;
                let svg = $(this).find('svg');

                let top = svg.offset().top - $(window).scrollTop() - svg.height() / 2 ;
                let left = svg.offset().left - $(window).scrollLeft() - svg.width() / 2;
                let width = svg.width() * 2;
                let height = svg.height() * 2;

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
        mouseCursor.css('background-color', 'transparent');
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