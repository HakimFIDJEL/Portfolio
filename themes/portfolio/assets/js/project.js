$(document).ready(function()
{

    let header = $(".header");
    let techno_used = $(".techno-used");
    let lastScrollTop = 0;
    let animation_opacity = $('.animation-opacity');
    let circle = $('.circle');



    $(".header").on('mouseenter', function()
    {
        if(!header.hasClass('active'))
        {
            header.addClass('active');
        }
    });

    $(".header").on('mouseleave', function()
    {
        if(header.hasClass('active'))
        {
            header.removeClass('active');
        }
    });


    $(window).on('scroll', function()
    {

        animateHeader();
        animationOpacity();
        animationCircle();


        if($(window).scrollTop() > techno_used.offset().top - 100)
        {
            lightHeader();
        }
        else    
        {
            darkHeader();
        }

        lastScrollTop = $(window).scrollTop();
    });

    function animationCircle()
    {

        if($(window).scrollTop() > circle.offset().top - 700 && $(window).scrollTop() < circle.offset().top + circle.height() + 700)
        {

            if(!circle.hasClass('active'))
            {
                circle.addClass('active');
                let timer = 0;
                let grade = circle.data('grade');
                setInterval(function()
                {
                    if(timer < grade)
                    {
                        timer++;
                        console.log(timer);
                        circle.css('--p', timer);
                        circle.find('.grade').html(timer + '%');
                    }
                }, timer);
                
                

            }

        }
    }

    function animationOpacity()
    {
        animation_opacity.each(function()
        {
            let $this = $(this);
            let this_top = $this.offset().top;

            if($(window).scrollTop() > this_top - 700 && $(window).scrollTop() < this_top + $this.height() + 700)
            {
                $this.removeClass('disappear');
                $this.addClass('appear');
            }
        });
    }

    function animateHeader()
    {
        // Si je scroll vers le bas
        if($(window).scrollTop() > lastScrollTop)
        {
            if(header.hasClass('active'))
            {
                header.removeClass('active');
            }
        }
        else
        {
            if(!header.hasClass('active'))
            {
                header.addClass('active');
            }
        }
    }

    function darkHeader()
    {
        if(!header.hasClass('dark'))
        {
            header.removeClass('light');
            header.addClass('dark');
        }
    }
    function lightHeader()
    {
        if(!header.hasClass('light'))
        {
            header.removeClass('dark');
            header.addClass('light');
        }
    }

});