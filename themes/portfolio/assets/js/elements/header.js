$(document).ready(function()
{
    let nav = $("nav .container");


    

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