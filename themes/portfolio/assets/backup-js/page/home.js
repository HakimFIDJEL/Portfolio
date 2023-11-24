$(document).ready(function() {
    
    
    

    setTimeout(function()
    {
        $("#home .title").addClass('active');
        $("#home .subtitle").addClass('active');
        $("#home .scroll-down").addClass('active');


    }, 200);

    $(document).on('click', '#home .scroll-down', function() {
        $('html, body').animate({
            scrollTop: $('#home .section').offset().top - 400
        }, 500);
    });


    
});
