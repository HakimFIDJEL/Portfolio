$(document).ready(function()
{

   $(document).on('click', ".accordeon .group-title", function()
   {
        if(getOrientation() == 'portrait')
        {
            let accordeon = $(this).parent();
            let accordeons = $(".accordeon");

            accordeons.each(function()
            {
                if ($(this).hasClass('active') && this != accordeon[0])
                {
                    closeAccordeon($(this));
                }
            });

            if (accordeon.hasClass('active'))
            {
                closeAccordeon(accordeon);
            }
            else
            {
                openAccordeon(accordeon);
            }
        }
   })
    
    $(document).on('click', '.accordeon .arrow', function()
    {

        if(getOrientation() == 'landscape')
        {
            let accordeon = $(this).parent().parent();
            let accordeons = $(".accordeon");
    
            accordeons.each(function()
            {
                if ($(this).hasClass('active') && this != accordeon[0])
                {
                    closeAccordeon($(this));
                }
            });
    
            if (accordeon.hasClass('active'))
            {
                closeAccordeon(accordeon);
            }
            else
            {
                openAccordeon(accordeon);
            }
        }

    });

    function openAccordeon(accordeon)
    {
        let content = accordeon.find('.group-content');

        content.css('height', 'auto');
        let height = content.height();
        content.css('height', '0px');

        accordeon.addClass('active');
        content.animate({
            'height': height + 'px',
        }, 400);
    }

    function closeAccordeon(accordeon)
    {
        let content = accordeon.find('.group-content');
        accordeon.removeClass('active');
        content.animate({
            'height': '0px',
        }, 400);
    }


});