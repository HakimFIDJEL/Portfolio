$(document).ready(function()
{

    let container = $('#last-projects .content-container');
    let switch_container = container.find('.switch-container');
    let switch_container_children = switch_container.children();
    let switch_cover = container.find('.switch-cover');
   
    let selector = container.find('.selector');

    let currentChildren = switch_container_children.first();
    let isInContainer = false;
    let lastScrollTop = 0;

    let isOut = false;

    let balises = $(".selector li");

    var iteration = 0;
    var isIterating = false;


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

    $(document).on('click', '.selector-container .left', function()
    {
        let index = getCurrentSlide();
        if(index == 0)
        {
            return;
        }
        prevSlide();
    });

    $(document).on('click', '.selector-container .right', function()
    {
        let index = getCurrentSlide();
        if(index == switch_container_children.length - 1)
        {
            return;
        }
        nextSlide();
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
                
                

                toggleHeader();
                $(window).scrollTop(container.offset().top);
                checkSlides();

                appear(index);
                $(switch_container_children[index]).addClass('active');
                
              
                
            }
        }
        else
        {
            $("body").css("overflow", "auto");
            
        }
    });

    // Gestion du scroll
    $(window).on('wheel', function(event)
    {


        // Reset si jamais il arrête de scroll
        if(!isIterating && isInContainer)
        {
            isIterating = true;
            setTimeout(function()
            {
                isIterating = false;
                iteration = 0;
                switch_cover.css('backdrop-filter', 'blur(0px)');
            }, 500);
        }


        
        let index = getCurrentSlide();
        // Si je suis dans le container
        if(isInContainer)
        {
          

            let delta = event.originalEvent.deltaY;
            // Si je scroll vers le bas
            if(delta > 0)
            {
                // Si je suis sur le dernier slide
                if(index == switch_container_children.length - 1)
                {
                    // Si j'ai assez scroll
                    if(iteration > 2)
                    {
                        isInContainer = false;
                        isOut = true;
                        $("body").css("overflow", "auto");
                        selectorDisappear();
                        disappear(index);
                        toggleHeader();
                    }
                    else 
                    {
                        iteration++;
                        switch_cover.css('backdrop-filter', 'blur('+iteration*2+'px)');
                    }
                }
                // Si je suis sur un autre slide
                else 
                {
                    // Si j'ai assez scroll
                    if(iteration > 2)
                    {
                        isInContainer = true;
                        isOut = false;
                        $(window).scrollTop(container.offset().top);
                        iteration = 0;
                        nextSlide();
                    }
                    else 
                    {
                        iteration++;
                        switch_cover.css('backdrop-filter', 'blur('+iteration*2+'px)');
                    }
                }
            }
            // Si je scroll vers le haut
            else
            {
                // Si je suis sur le premier slide
                if(index == 0)
                {
                    // Si j'ai assez scroll
                    if(iteration > 2)
                    {
                        isInContainer = false;
                        isOut = false;
                        $("body").css("overflow", "auto");
                        selectorDisappear();
                        disappear(0);
                        toggleHeader();
                    }
                    else 
                    {
                        iteration++;
                        switch_cover.css('backdrop-filter', 'blur('+iteration*2+'px)');
                    }
                }
                // Si je suis sur un autre slide
                else
                {
                    isInContainer = true;
                    isOut = false;
                    $(window).scrollTop(container.offset().top);
                    // Si j'ai assez scroll
                    if(iteration > 2)
                    {
                        iteration = 0;
                        prevSlide();
                    }
                    else 
                    {
                        iteration++;
                        switch_cover.css('backdrop-filter', 'blur('+iteration*2+'px)');
                    }
                }
            }
        }
        
    });


    function appear(index)
    {
        let slide = switch_container_children[index];
        let content = $(slide).find('.content');

        checkSlides();

        

        $(content).children().each(function(i, e)
        {
            $(e).css('opacity', '0');
            $(e).css('top', '-40px');
        });
        $(content).removeClass('disappear');
        $(content).addClass('appear');

    }

    function disappear(index)
    {
        let slide = switch_container_children[index];

        let content = $(slide).find('.content');

        checkSlides();

        $(content).children().each(function(i, e)
        {
            $(e).css('opacity', '1');
            $(e).css('top', '0px');
        });
        $(content).removeClass('appear');
        $(content).addClass('disappear');
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
        switch_cover.css('backdrop-filter', 'blur(0px)');


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

    function checkSlides() {
        let index = getCurrentSlide();

        switch_container_children.each(function(i, e)
        {
            $(e).removeClass('appear');
            $(e).addClass('disappear');
        });

    
        const arrow_left = container.find('.left');
        const arrow_right = container.find('.right');
        const switch_container_children_length = switch_container_children.length;
        
        $(selector).removeClass('disappear');
        $(selector).addClass('appear');
    
        if (index == 0) {

            if(arrow_left.css('opacity') != 0)
            {
                $(arrow_left).removeClass('appear');
                $(arrow_left).addClass('disappear');
            }
            $(arrow_right).removeClass('disappear');
            $(arrow_right).addClass('appear');
            
        } else if (index == switch_container_children_length - 1) {
            $(arrow_right).removeClass('appear');
            $(arrow_right).addClass('disappear');

            $(arrow_left).removeClass('disappear');
            $(arrow_left).addClass('appear');
        } else {
            $(arrow_left).removeClass('disappear');
            $(arrow_left).addClass('appear');

            $(arrow_right).removeClass('disappear');
            $(arrow_right).addClass('appear');
        }
    }
    

    function selectorDisappear()
    {
        let arrow_left = container.find('.left');
        let arrow_right = container.find('.right');


        setTimeout(function()
        {
            $(selector).removeClass('appear');
            $(selector).addClass('disappear');

            $(arrow_left).removeClass('appear');
            $(arrow_left).addClass('disappear');

            $(arrow_right).removeClass('appear');
            $(arrow_right).addClass('disappear');
        }, 10);


    }


});