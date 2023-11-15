var body = $('body');
var header = $('header');

$(document).ready(function()
{
   

    $(window).on('wheel', function(e)
    {
        toggleHeader();
    });
});

function toggleHeader()
{
    if(body.css('overflow') == 'hidden')
    {
        if(header.css('top') != '-100px')
        {
            header.animate({top: -100}, 300, 'linear');
        }
    }
    else {
        if(header.css('top') == '-100px')
        {
            header.animate({top: 0}, 500, 'linear');
        }
    }
}