$(document).ready(function()
{

    $(document).on('mouseenter', '.accordeon .arrow', function()
    {
        let svg = $(this).find('svg');
        let accordeon = $(this).parent().parent();
        if(!accordeon.hasClass('active'))
        {
            svg.css('transform', 'rotate(35deg)');
        }
    });
    $(document).on('mouseleave', '.accordeon .arrow', function()
    {
        let svg = $(this).find('svg');
        let accordeon = $(this).parent().parent();
        if(!accordeon.hasClass('active'))
        {
            svg.css('transform', 'rotate(0deg)');
        }
    });
    
    $(document).on('click', '.accordeon .arrow', function()
    {
        let accordeon = $(this).parent().parent();
        let accordeons = $(".accordeon");
        let content = accordeon.find('.group-content');
        let svg = $(this).find('svg');
        
        accordeons.each(function()
        {
            if ($(this).hasClass('active') && this != accordeon[0])
            {
                $(this).removeClass('active');
                $(this).find('.group-content').animate({'height': '0px'}, 400);
                $(this).find('.arrow svg').css('transform', 'rotate(0deg)');
            }
        });

        if (accordeon.hasClass('active'))
        {
            accordeon.removeClass('active');
            svg.css('transform', 'rotate(0deg)');
            content.animate({
                'height': '0px',
            }, 400);
        }
        else
        {
            content.css('height', 'auto');
            let height = content.height();
            content.css('height', '0px');

            accordeon.addClass('active');
            svg.css('transform', 'rotate(90deg)');
            content.animate({
                'height': height + 'px',
            }, 400);
        }
    });


});