$(document).ready(function()
{
    let window_top =  $(window).scrollTop();
    let window_height = $(window).height();
    let lastScrollTop = 0;
    let header = $('header');
    let header_fonts = $("header .nav a");
    let header_logo = $("header .socials a svg");
 
    let home_section = $('#home .section');
    let home_title = $('#home .title');
    let home_subtitle = $('#home .subtitle');
    let allprojects_groups = $(".group-container");
    let about_blockTitles = $("#about .block-group-title");
   
    // let about_parallax_top = $("#about .hero-container").offset().top;
    // let about_parallax_height = $("#about .hero-container").height();
    let about_parallax = $("#about .parallax");
    let about_title = $("#about .group-title .title");
    let about_title_top = about_title.offset().top;
    // let about_title_height = about_title.height();
    // let about_subtitle = $("#about .group-title .subtitle");
    // let about_subtitle_top = about_subtitle.offset().top;
    // let about_subtitle_height = about_subtitle.height();
    let about_timer = 0;
    

    let sectionScrolled  = "home";


    let home_top = $('#home').offset().top;
    let home_bottom = home_top + $('#home').height();

    let about_top = $('#about .experience-container').offset().top;
    let about_bottom = $('#about .about-container').offset().top + $('#about .about-container').height();
    
    let animation_opacity = $('.animation-opacity');
    let animation_translate = $('.animation-translate');

    let burgerContainer = $(".burger-container");
    let nav = $("nav");

    let mouseCursor = $(".mouse-cursor");
    
    $(window).on('resize', function()
    {
        window_height = $(window).height();
    });

    $(window).on('scroll', function(e)
    {

        sectionIsScrolled();
        
        window_top = $(window).scrollTop();

        HeaderAnimation();
        HeaderColor();

        

        // Home_scroll();

        AllProjects_checkOnScreen();

        // About_parallaxAnimation();

        

        lastScrollTop = window_top;
    });


    function sectionIsScrolled()
    {
        let tempScrolled = sectionScrolled;
        if(window_top + window_height >= home_top && window_top <= home_bottom)
        {
            sectionScrolled = "home";
        }
        else if(window_top + window_height >= about_top && window_top <= about_bottom)
        {
            sectionScrolled = "about";
        }
        else if(window_top + window_height >= $("#all-projects").offset().top && window_top <= $("#all-projects").offset().top + $("#all-projects").height())
        {
            sectionScrolled = "all-projects";
        }
        else if(window_top + window_height >= $("#contact").offset().top && window_top <= $("#contact").offset().top + $("#contact").height())
        {
            sectionScrolled = "contact";
        }


        if(tempScrolled != sectionScrolled)
        {
            $(".nav li").removeClass('active');
            $(".nav li a[data-ref='"+sectionScrolled+"']").parent().addClass('active');
        }
    }
   
    



    function HeaderColor()
    {
        // Si le header est dans la section home
        if(header.offset().top + header.height() >= home_top && header.offset().top <= home_bottom)
        {
            headerDark();
        }
        // Si le header est dans la section about
        else if(header.offset().top + header.height() >= about_top && header.offset().top <= about_bottom)
        {
            headerDark();
        }
        // Si le header est dans la section all-projects
        else if(header.offset().top + header.height() >= $("#all-projects").offset().top && header.offset().top <= $("#all-projects").offset().top + $("#all-projects").height())
        {
            headerDark();
        }
        else 
        {
            headerLight();
        }
    }

    function headerDark()
    {
        if(header.hasClass('light'))
        {
            header.removeClass('light');
        }
        if(!header.hasClass('dark'))
        {
            header.addClass('dark');
        }
        if(burgerContainer.hasClass('light'))
        {
            burgerContainer.removeClass('light');
        }
        if(!burgerContainer.hasClass('dark'))
        {
            burgerContainer.addClass('dark');
        }        
        return;
    }
    function headerLight()
    {
        if(header.hasClass('dark'))
        {
            header.removeClass('dark');
        }
        if(!header.hasClass('light'))
        {
            header.addClass('light');
        }        
        if(burgerContainer.hasClass('dark'))
        {
            burgerContainer.removeClass('dark');
        }
        if(!burgerContainer.hasClass('light'))
        {
            burgerContainer.addClass('light');
        }
        return;
    }

    function HeaderAnimation()
    {
        // On va vers le bas
        if(window_top > lastScrollTop)
        {
            if(header.hasClass('active'))
            {
                header.removeClass('active');
            }
            if(burgerContainer.hasClass('active') && !$("nav .container").hasClass('active'))
            {
                burgerContainer.removeClass('active');
            }
        }
        // On va vers le haut
        else 
        {
            if(!$("#last-projects .switch-container").hasClass('active'))
            {
                if(!header.hasClass('active'))
                {
                    header.addClass('active');
                }
            }
            else 
            {
                if(header.hasClass('active'))
                {
                    header.removeClass('active');
                }
            }
            if(!burgerContainer.hasClass('active'))
            {
                burgerContainer.addClass('active');
            }
        }
    }

    // Fonctions section all-projects
    function AllProjects_checkOnScreen()
    {
        
        allprojects_groups.each(function()
        {
            let group = $(this);
            let groupTop = group.offset().top;

            if($(window).scrollTop() > groupTop - 700 && $(window).scrollTop() < groupTop + group.height() + 700)
            {
                group.removeClass('disappear');
                group.addClass('appear');
            }
            else 
            {
                group.removeClass('appear');
                group.addClass('disappear');
            }
        });
    }



    
});