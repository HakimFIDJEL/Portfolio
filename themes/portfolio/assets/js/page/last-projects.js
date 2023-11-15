$(document).ready(function()
{

    let container = $('#last-projects .content-container');
    let switch_container = container.find('.switch-container');
    let switch_container_children = switch_container.children();

    let currentChildren = switch_container_children.first();
    let isInContainer = false;
    let lastScrollTop = 0;

    let isOut = false;

    let balises = $(".selector li");

    var header = $('header');

    $(document).on('click', '.selector li', function()
    {
        let index = $(this).index();
        let old_slide = getCurrentSlide();
        disappear(old_slide);

        balises.each(function(i, e)
        {
            $(e).removeClass('active');
        });
        $(this).addClass('active');

        goTo(index);

        setTimeout(function()
        {
            appear(index);
        }, 600);
    });


    // Détecte si on est dans le carousel ou pas
    $(window).scroll(function()
    {
        let scroll = $(window).scrollTop();
        let containerTop = container.offset().top;
        let containerBottom = containerTop + container.height();
        let index = getCurrentSlide();

        // Si le haut de la fenêtre est dans le cadre et que 
        if(scroll >= containerTop && scroll <= (containerTop + 500) )
        {
            isInContainer = true;
            if(!isOut)
            {
                $("body").css("overflow", "hidden");
                header.animate({
                    top: -100,
                }, 350);
                

                
                $(window).scrollTop(container.offset().top);


                
              
                // Première fois qu'on arrive dans le container - première animation
                if(index == 0 && !$(switch_container_children[0]).hasClass('active'))
                {
                    $(switch_container_children[0]).addClass('active');
                    appear(0);
                }
            }
        }
        else
        {
            $("body").css("overflow", "auto");
            header.animate({
                top: 0,
            }, 500);
        }
    });

    // Gestion du scroll
    $(window).on('wheel', function(event)
    {
        
        let index = getCurrentSlide();
        if(isInContainer)
        {
            let delta = event.originalEvent.deltaY;
            if(delta > 0)
            {
                if(index == switch_container_children.length - 1)
                {
                    isInContainer = false;
                    isOut = true;
                    $("body").css("overflow", "auto");
                    header.animate({
                        top: 0,
                    }, 500);
                }
                else 
                {
                    isInContainer = true;
                    isOut = false;
                    $(window).scrollTop(container.offset().top);

                    nextSlide();
                }
            }
            else
            {
                if(index == 0)
                {
                    isInContainer = false;
                    isOut = false;
                    $("body").css("overflow", "auto");
                    header.animate({
                        top: 0,
                    }, 500);
                }
                else
                {
                    isInContainer = true;
                    isOut = false;
                    $(window).scrollTop(container.offset().top);


                    prevSlide();
                }
            }
        }
        
    });


    function appear(index)
    {
        let slide = switch_container_children[index];

        let subtitle = $(slide).find('.subtitle');
        let title = $(slide).find('.title');
        let text = $(slide).find('.text');

        setTimeout(function()
        {
            subtitle.animate({
                top: 0,
                opacity: 1,
            }, 400);
        }, 0);

        setTimeout(function()
        {
            title.animate({
                top: 0,
                opacity: 1,
            }, 400);
        }, 50);

        setTimeout(function()
        {
            text.animate({
                top: 0,
                opacity: 1,
            }, 400);
        }, 100);

        
    }

    function disappear(index)
    {
        let slide = switch_container_children[index];

        let subtitle = $(slide).find('.subtitle');
        let title = $(slide).find('.title');
        let text = $(slide).find('.text');

        setTimeout(function()
        {
            subtitle.animate({
                top: 30,
                opacity: 0,
            }, 400, function()
            {
                subtitle.css('top', '-30px');
            });
        }, 0);

        setTimeout(function()
        {
            title.animate({
                top: 30,
                opacity: 0,
            }, 400, function()
            {
                title.css('top', '-30px');
            });
        }, 50);

        setTimeout(function()
        {
            text.animate({
                top: 30,
                opacity: 0,
            }, 400, function()
            {
                text.css('top', '-30px');
            });
        }, 100);
    }

   

    

    

    function nextSlide()
    {
        let current = getCurrentSlide();

        disappear(current);

        let next = current + 1;
        if(next >= switch_container_children.length)
        {
            next = 0;
        }
        goTo(next);

        setTimeout(function()
        {
            appear(next);
        }, 600);
    }

    function prevSlide()
    {
        let current = getCurrentSlide();

        disappear(current);

        let prev = current - 1;
        if(prev < 0)
        {
            prev = switch_container_children.length - 1;
        }
        goTo(prev);

        setTimeout(function()
        {
            appear(prev);
        }, 600);
    }

    function goTo(index)
    {
        let children = switch_container.children();
        children.each(function(i, e)
        {
            $(e).removeClass('active');
        });
        $(children[index]).addClass('active');

        
        balises.each(function(i, e)
        {
            $(e).removeClass('active');
        });

        $(balises[index]).addClass('active');
        $(balises[index]).find('input').prop('checked', true);


        switch_container.css('transform', 'translateX(-' + index * 100 + '%)');
    }

    function getCurrentSlide()
    {
        let children = switch_container.children();
        let index = 0;
        children.each(function(i, e)
        {
            if($(e).hasClass('active'))
            {
                index = i;
            }
        });
        return index;
    }



});