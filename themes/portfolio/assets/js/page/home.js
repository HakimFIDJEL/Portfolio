$(document).ready(function() {
    
    
    


    $(document).on('click', '#home .scroll-down', function() {
        $('html, body').animate({
            scrollTop: $('#home .section').offset().top - 400
        }, 500);
    });


    
});
