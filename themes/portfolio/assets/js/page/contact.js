$(document).ready(function()
{   
    let form = $('.contact-form');
    let button = form.find('button');
    let spinner = button.find('.spinner');
    let svg = button.find('svg');
    
    $(document).on('submit', '.contact-form', function()
    {
        button.attr('disabled', true);
        svg.hide();
        spinner.show();
        button.css('outline', '1px solid white');
        button.css('background', '#1c1d1f');
        button.css('color', 'white');
    });

   
    
  


});