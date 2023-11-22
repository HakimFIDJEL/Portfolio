$(document).ready(function()
{   
    let slide_title = $('.slide-title');
    let slide_top;
    let slide_bottom;
    let group = slide_title.find('.group');
   
    
    $(window).on('scroll', function() 
    {
        let window_top = $(window).scrollTop();
        let window_height = $(window).height();

        slide_title.each(function()
        {
            slide_top = $(this).offset().top;
            slide_bottom = slide_top + $(this).height();

            console.log('slide_top', slide_top);    
            console.log('slide_bottom', slide_bottom);
            console.log('window_top', window_top);
            console.log('window_bottom', window_top + window_height);

            if (window_top + window_height >= slide_top && window_top <= slide_bottom) 
            {
                let scrollPercent = (window_top + window_height - slide_top) / (slide_bottom - slide_top + window_height);
                scrollPercent = Math.max(0, Math.min(1, scrollPercent));
                let translateValue = -20 * scrollPercent;
                group.css('transform', 'translate(' + translateValue + '%, 0)');
            }
        });

        
    });
    

   
    
  


});