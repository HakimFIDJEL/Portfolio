$(document).ready(function()
{
    $(document).on('click', '.accordeon .arrow', function()
    {
        let accordeon = $(this).parent().parent();
        let accordeons = $(".accordeon");
        
        accordeons.each(function()
        {
            if ($(this).hasClass('active') && this != accordeon[0])
            {
                $(this).removeClass('active');
            }
        });

        if (accordeon.hasClass('active'))
        {
            accordeon.removeClass('active');
        }
        else
        {
            accordeon.addClass('active');
        }
    });
});