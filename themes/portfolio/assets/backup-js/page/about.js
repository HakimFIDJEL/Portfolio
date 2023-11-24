$(document).ready(function()
{

   
    
    $(document).on('click', '.accordeon .arrow', function()
    {
        let accordeon = $(this).parent().parent();
        let accordeons = $(".accordeon");
        let content = accordeon.find('.group-content');

        accordeons.each(function()
        {
            if ($(this).hasClass('active') && this != accordeon[0])
            {
                $(this).removeClass('active');
                $(this).find('.group-content').animate({'height': '0px'}, 400);
            }
        });

        if (accordeon.hasClass('active'))
        {
            accordeon.removeClass('active');
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
            content.animate({
                'height': height + 'px',
            }, 400);
        }
    });


});