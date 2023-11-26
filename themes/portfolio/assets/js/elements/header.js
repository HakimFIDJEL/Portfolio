$(document).ready(function()
{
    let popup = $(".header-popup");
    let top, left;
    let nav = $("nav .container");
    $(document).on('mouseenter', '.socials a', function()
    {
        let data_text = $(this).data('text');
        
        top = $(this).offset().top + $(this).height() + 10;
        left = $(this).offset().left - 10;


        popup.text(data_text);
        popup.css('top', top + 'px');
        popup.css('left', left + 'px');

        setTimeout(function()
        {
            popup.css('opacity', 1);
        }, 100);


    });
    $(document).on('mouseleave', '.socials a', function()
    {
        popup.css('opacity', 0);
    });

    $(document).on('click', '.burger-container input, nav .cover', function()
    {
        if(nav.hasClass('active'))
        {
            nav.removeClass('active');
            $(".burger-container input").prop('checked', false);
        }
        else
        {
            nav.addClass('active');
            $(".burger-container input").prop('checked', true);
        }
    });
    $(document).on('click', 'nav .container a', function()
    {
        nav.removeClass('active');
        $(".burger-container input").prop('checked', false);
    });


});