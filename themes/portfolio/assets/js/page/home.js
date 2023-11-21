$(document).ready(function() {
    let parallax = $('#home .parallax img');
    let section = $('#home .section');
    let title = $('#home .title');
    let subtitle = $('#home .subtitle');

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

    $(window).on('scroll', function() {

        if($(window).scrollTop() == 0)
        {
            if(!$("#home .scroll-down").hasClass('active'))
            {
                $("#home .scroll-down").addClass('active');   
            }
        }
        else 
        {
            if($("#home .scroll-down").hasClass('active'))
            {
                $("#home .scroll-down").removeClass('active');   
            }
        }


        animateParallax();
    });

    function animateParallax() {
        let window_top = $(window).scrollTop();
        let window_height = $(window).height();
        let parallax_top = $('#home .parallax').offset().top;
        let parallax_height = $('#home .parallax').height();

        // Vérifier si le parallaxe est sur notre écran
        if (window_top + window_height > parallax_top && window_top < parallax_top + parallax_height) {
      

            // Calculer la progression du défilement par rapport au parallaxe
            let scroll_within_parallax = window_top - parallax_top;
            let scroll_ratio = scroll_within_parallax / parallax_height;

            

            parallax.css('top', scroll_ratio * 25 + '%');
        }

        section.each(function()
        {
            if (window_top + window_height >= $(this).offset().top + 100 && window_top <= $(this).offset().top + $(this).height() - 100)
            {
                $(this).addClass('active');
            }
            else 
            {
                $(this).removeClass('active');
            }
        });
        if (window_top + window_height >= title.offset().top + 200 && window_top <= title.offset().top + title.height() - 200)
        {
            title.addClass('active');
        }
        else 
        {
            title.removeClass('active');
        }
        if (window_top + window_height >= subtitle.offset().top + 200 && window_top <= subtitle.offset().top + subtitle.height() - 200)
        {
            subtitle.addClass('active');
        }
        else 
        {
            subtitle.removeClass('active');
        }
    }
});
