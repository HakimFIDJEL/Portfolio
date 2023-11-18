$(document).ready(function()
{
    let container = $('#last-projects .content-container');
    let switch_container = $('#last-projects .switch-container');
    let switch_cover = $('#last-projects .switch-cover');
    let selector_container = $('#last-projects .selector-container');
    let dummy;
    let tempDummy;
    let isOut;

    // Vérification au rechargement de la page

    reload();

    $(document).on('click', '.selector li', function()
    {
        let index = $(this).index();
        let balises = selector_container.find('.selector li');

        if(index == 0)
        {
            $(window).scrollTop($('.dummy-project').eq(index).offset().top + 20);
        }
        else if (index == $('.dummy-project').length - 1)
        {
            $(window).scrollTop($('.dummy-project').eq(index).offset().top - 20);
        }
        else 
        {
            $(window).scrollTop($('.dummy-project').eq(index).offset().top);
        }



        
        balises.each(function(i, e)
        {
            $(e).removeClass('active');
        });
        $(this).addClass('active');
    });

    $(document).on('click', '.selector-container .left', function()
    {
        let index = dummyAbove();
        if(index == 0)
        {
            return;
        }
        $(window).scrollTop($('.dummy-project').eq(index - 1).offset().top + 20);
    });

    $(document).on('click', '.selector-container .right', function()
    {
        let index = dummyAbove();
        if(index == $('.dummy-project').length - 1)
        {
            return;
        }
        $(window).scrollTop($('.dummy-project').eq(index + 1).offset().top - 20);
    });

   
    $(window).on('scroll', function(e)
    {
        if(isInContainer())
        {
            // On ajoute la classe active si c'est pas déjà le cas (règle la position du container)
            if(!switch_container.hasClass('active'))
            {
                switch_container.addClass('active');
            }
            if(!selector_container.hasClass('active'))
            {
                selectorAppear();
            }
            goTo(dummyAbove());

            tempDummy = dummyAbove();
            if(tempDummy != dummy)
            {
                dummy = tempDummy;
                switch_cover.css('backdrop-filter', 'blur(20px)');
                setTimeout(function()
                {
                    switch_cover.css('backdrop-filter', 'blur(0px)');
                }, 500);
                
            }
        }
        else 
        {
            switch_container.removeClass('active');

            if(selector_container.hasClass('active'))
            {
                selectorDisappear();

            }

            arrowDisappear();
            isAboveOrBelow();
        }
    });

    // Return true si le container est dans la fenêtre
    function isInContainer()
    {
        let window_top = $(window).scrollTop();
        let window_bottom = window_top + $(window).height();
        let container_top = container.offset().top;
        let container_bottom = container_top + container.outerHeight();

        return ((container_bottom >= window_bottom) && (container_top <= window_top));
    }

    // Ajoute la classe top ou bottom au container en fonction de la position de la fenêtre
    function isAboveOrBelow()
    {
        if($(window).scrollTop() < container.offset().top)
        {
            switch_container.removeClass('active');
            switch_container.removeClass('bottom');
            switch_container.addClass('top');
            dummy = 0;
        }
        else 
        {
            switch_container.removeClass('active');
            switch_container.removeClass('top');
            switch_container.addClass('bottom');
            dummy = $('.dummy-project').length - 1;
        }

        $('.switch-box').eq(dummy).removeClass('active');
        slideDisappear($('.switch-box').eq(dummy));
    }

    // Fonction appelée au rechargement de la page
    function reload()
    {
        if(isInContainer())
        {
            switch_container.addClass('active');
        }
        else 
        {
            isAboveOrBelow();
        }
    }

    // Retourne le div .dummy-project qui est le plus survolé par le fenêtre
    function dummyAbove() 
    {
        let window_top = $(window).scrollTop();
        let window_bottom = window_top + $(window).height();
        let dummy_projects = $('.dummy-project');
        let mostVisibleDummy = null;
        let maxVisibleHeight = 0;
    
        dummy_projects.each(function() {
            let dummy_project_top = $(this).offset().top;
            let dummy_project_height = $(this).outerHeight();
            let dummy_project_bottom = dummy_project_top + dummy_project_height;
    
            // Calculer la hauteur visible
            let visibleTop = Math.max(dummy_project_top, window_top);
            let visibleBottom = Math.min(dummy_project_bottom, window_bottom);
            let visibleHeight = Math.max(0, visibleBottom - visibleTop);
    
            // Mise à jour si cet élément est plus visible que les précédents
            if (visibleHeight > maxVisibleHeight) {
                maxVisibleHeight = visibleHeight;
                mostVisibleDummy = $(this);
            }
        });
    
        return mostVisibleDummy.data('ref');
    }

    // Déplace le container en fonction de l'index
    function goTo(index)
    {
        
        updateSelector();
        
        let children = switch_container.children();
        let old_slide = children.filter('.active');
        let new_slide = children.eq(index);

        children.removeClass('active');
        new_slide.addClass('active');

        switch_container.css('transform', 'translateX(-' + index * 100 + '%)');

        slideDisappear(old_slide);
        slideAppear(new_slide);

        arrowVerify();

    }

    // Fonction qui fait disparaitre le contenu d'un slide
    function slideDisappear(old_slide)
    {
        let content = old_slide.find('.content');

        if($(content).hasClass('appear'))
        {
            $(content).children().each(function(i, e)
            {
                $(e).css('opacity', '1');
                $(e).css('top', '0px');
            });
            $(content).removeClass('appear');
            $(content).addClass('disappear');
        }

        
    }

    // Fonction qui fait apparaitre le contenu d'un slide
    function slideAppear(new_slide)
    {
        let content = new_slide.find('.content');
        $(content).children().each(function(i, e)
        {
            $(e).css('opacity', '0');
            $(e).css('top', '-40px');
        });
        $(content).removeClass('disappear');
        $(content).addClass('appear');
    }

    // Fonction qui fait apparaitre le selecteur
    function selectorAppear()
    {
        selector_container.addClass('active');
        selector_container.find('.selector').removeClass('disappear');
        selector_container.find('.selector').addClass('appear');
    }

    // Fonction qui fait disparaitre le selecteur
    function selectorDisappear()
    {
        selector_container.removeClass('active');
        selector_container.find('.selector').removeClass('appear');
        selector_container.find('.selector').addClass('disappear');
    }

    function arrowVerify()
    {
        let index = dummyAbove();
        let arrow_left = $('.selector-container .left');
        let arrow_right = $('.selector-container .right');

        switch(index)
        {
            case 0 :
                if(arrow_left.css('opacity') != 0)
                {
                    arrow_left.removeClass('appear');
                    arrow_left.addClass('disappear');
                }
                arrow_right.removeClass('disappear');
                arrow_right.addClass('appear');
            break;
            case $('.dummy-project').length - 1 :
                arrow_right.removeClass('appear');
                arrow_right.addClass('disappear');
    
                arrow_left.removeClass('disappear');
                arrow_left.addClass('appear');
            break;
            default :
                arrow_left.removeClass('disappear');
                arrow_left.addClass('appear');

                arrow_right.removeClass('disappear');
                arrow_right.addClass('appear');
            break;

        }
    }

    function arrowDisappear()
    {
        let arrow_left = $('.selector-container .left');
        let arrow_right = $('.selector-container .right');

        if(arrow_left.hasClass('appear'))
        {
            arrow_left.removeClass('appear');
            arrow_left.addClass('disappear');
        }
        if(arrow_right.hasClass('appear'))
        {
            arrow_right.removeClass('appear');
            arrow_right.addClass('disappear');
        }
    }
    
    function updateSelector()
    {
        let index = dummyAbove();
        let balises = selector_container.find('.selector li');
        balises.each(function(i, e)
        {
            $(e).removeClass('active');
        });
        balises.eq(index).addClass('active');
        $(balises[index]).find('input').prop('checked', true);
    }
    


});

