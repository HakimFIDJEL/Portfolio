$(document).ready(function()
{

    var windowTop = $(window).scrollTop();
    var windowBottom = windowTop + $(window).height();

    var container = $('#last-projects .content-container');
    var containerTop = container.offset().top;
    var containerBottom = containerTop + container.height();

    var numberOfProjects = $('#last-projects .dummy-project').length;
    var projectToShow = 0;
    var tempProjectToShow = 0;

    let switch_container = $('#last-projects .switch-container');
    let switch_cover = $('#last-projects .switch-cover');
    let selector_container = $('#last-projects .selector-container');
    let progressBar = $('#last-projects .progress-container');

    let old_content;
    let new_content;

    reload();

    $(document).on('keydown', function(e)
    {
        if(e.keyCode == 37)
        {
            prev();
        }
        else if(e.keyCode == 39)
        {
            next();
        }
    });

    $(document).on('click', '.selector li', function()
    {
        let index = $(this).index();
        let balises = selector_container.find('.selector li');

        $('html').css('scroll-behavior', 'auto');
        $(window).scrollTop($('.dummy-project').eq(index).offset().top + 5);
        $('html').css('scroll-behavior', 'smooth');

        balises.each(function(i, e)
        {
            $(e).removeClass('active');
        });
        $(this).addClass('active');
    });

    $(document).on('click', '.selector-container .left', function()
    {
        $('html').css('scroll-behavior', 'auto');
        prev();
        $('html').css('scroll-behavior', 'smooth');
    });

    $(document).on('click', '.selector-container .right', function()
    {
        $('html').css('scroll-behavior', 'auto');
        next();
        $('html').css('scroll-behavior', 'smooth');
    });





    $(window).on('scroll', function()
    {
        windowTop = $(window).scrollTop();
        windowBottom = windowTop + $(window).height();
        if(isInContainer())
        {

            // On stick le container
            addActiveToSelector();

            // On recupère le bon projet
            getProjectToShow();

            // On affiche le bon projet
            new_content = $(".switch-box .content").eq(projectToShow);
            if(!new_content.hasClass('appear'))
            {
                slideAppear(new_content);
            }

            // On s'occupe de la barre de progression
            progressBarLoad();

            if(tempProjectToShow != projectToShow)
            {
                old_content = $(".switch-box .content").eq(tempProjectToShow);
                new_content = $(".switch-box .content").eq(projectToShow);

                slideDisappear(old_content);
                slideAppear(new_content);

                tempProjectToShow = projectToShow;
                displayProject(projectToShow);
            }
        }
        else 
        {
            removeActiveToSelector();
            old_content = $(".switch-box .content").eq(tempProjectToShow);
            slideDisappear(old_content);
            arrowDisappear();
            
        }
    });

    // Check if the window is in the container
    function isInContainer()
    {
        return (windowTop > containerTop && windowBottom < containerBottom);
    }

    // Returns the project to show according to window Top
    function getProjectToShow()
    {
        $(".dummy-project").each(function(index)
        {
            var projectTop = $(this).offset().top;
            var projectBottom = projectTop + $(this).height();
            if(windowTop > projectTop && windowTop < projectBottom)
            {
                projectToShow = index;
            }
        });
        return projectToShow;
    }

    // Adjust the selector position
    function addActiveToSelector()
    {
        arrowVerify();
        if(!switch_container.hasClass('active'))
        {
            switch_container.addClass('active');
        }
        if(!selector_container.hasClass('active'))
        {
            selector_container.addClass('active');
            selector_container.find('.selector').removeClass('disappear');
            selector_container.find('.selector').addClass('appear');
        }
        if(!progressBar.hasClass('active'))
        {
            progressBar.addClass('active');
        }
    }

    // Adjust the selector position
    function removeActiveToSelector()
    {
        arrowVerify();
        if(switch_container.hasClass('active'))
        {
            switch_container.removeClass('active');
            if(windowTop > containerTop)
            {
                switch_container.css('bottom', 0);
                switch_container.css('top', '');
            }
            else 
            {
                switch_container.css('top', 0);
                switch_container.css('bottom', '');
            }
        }
        if(selector_container.hasClass('active'))
        {
            selector_container.removeClass('active');
            selector_container.find('.selector').removeClass('appear');
            selector_container.find('.selector').addClass('disappear');
        }
        if(progressBar.hasClass('active'))
        {
            progressBar.removeClass('active');
        }
    }

    // Display the correct project
    function displayProject(index)
    {
        var projectsAbove = $(".switch-box:lt(" + index + ")");
        var projectsBelow = $(".switch-box:gt(" + index + ")");
        var project = $(".switch-box:eq(" + index + ")");

        project.addClass('active');
        projectsBelow.removeClass('active');
        projectsAbove.addClass('active');
        

        updateSelector();
        arrowVerify();

    }

    // Appear the content of the displayed project
    function slideAppear(content)
    {
        if(switch_container.hasClass('active'))
        {
            $(content).children().each(function(i, e)
            {
                $(e).css('opacity', '0');
                $(e).css('top', '-40px');
            });
            $(content).removeClass('disappear');
            $(content).addClass('appear');
        }
    }

    // Disappear the content of the displayed project
    function slideDisappear(content)
    {
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

    function progressBarLoad()
    {
        let dummyShown = $('.dummy-project').eq(projectToShow);
        let dummyHeight = $('.dummy-project').eq(0).height();
        let percent = (windowTop - dummyShown.offset().top) / dummyHeight * 100;

        progressBar.css('width', percent + '%');
    }


    function arrowVerify()
    {
        if(switch_container.hasClass('active'))
        {
            let arrow_left = $('.selector-container .left');
            let arrow_right = $('.selector-container .right');

    
            switch(getProjectToShow())
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
        let balises = selector_container.find('.selector li');
        balises.each(function(i, e)
        {
            $(e).removeClass('active');
        });
        balises.eq(getProjectToShow()).addClass('active');
        $(balises[getProjectToShow()]).find('input').prop('checked', true);
    }

    function prev()
    {
        if(getProjectToShow() == 0)
        {
            return;
        }
        $(window).scrollTop($('.dummy-project').eq(getProjectToShow() - 1).offset().top + 5);
    }
    function next()
    {
        if(getProjectToShow() == $('.dummy-project').length - 1)
        {
            return;
        }
        $(window).scrollTop($('.dummy-project').eq(getProjectToShow() + 1).offset().top + 5);
    }

    function reload()
    {
        if(isInContainer())
        {
            switch_container.addClass('active');
        }
        else 
        {
            if(windowBottom > containerBottom)
            {
                switch_container.css('bottom', 0);
                $(".switch-box").addClass('active');
            }
        }
    }
 

});