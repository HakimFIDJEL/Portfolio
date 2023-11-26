$(document).ready(function()
{
    let window_top =  $(window).scrollTop();
    let window_height = $(window).height();
    let lastScrollTop = 0;
    let header = $('header');
    let header_fonts = $("header .nav a");
    let header_logo = $("header .socials a svg");
    let home_parallax_top = $('#home .parallax').offset().top;
    let home_parallax_height = $('#home .parallax').height();
    let home_parallax = $('#home .parallax img');
    let home_section = $('#home .section');
    let home_title = $('#home .title');
    let home_subtitle = $('#home .subtitle');
    let allprojects_groups = $(".group-container");
    let about_blockTitles = $("#about .block-group-title");
    let about_skillsContainer = $("#about .skills-container");
    let about_skills = $("#about .skills-container .skill");
    let about_parallax_top = $("#about .hero-container").offset().top;
    let about_parallax_height = $("#about .hero-container").height();
    let about_parallax = $("#about .parallax");
    let about_title = $("#about .group-title .title");
    let about_title_top = about_title.offset().top;
    let about_title_height = about_title.height();
    let about_subtitle = $("#about .group-title .subtitle");
    let about_subtitle_top = about_subtitle.offset().top;
    let about_subtitle_height = about_subtitle.height();
    let about_timer = 0;
    let slide_title = $('.slide-title');
    let slide_top;
    let slide_bottom;


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

        
        window_top = $(window).scrollTop();

        HeaderAnimation();
        HeaderColor();

        

        Home_scroll();

        AllProjects_checkOnScreen();

        About_blockTitleAnimation();
        About_skillAnimation();
        About_parallaxAnimation();

        ContactScroll();

        animationOpacity();
        animationTranslate();
        

        lastScrollTop = window_top;
    });


  
   
    

    function animationOpacity()
    {
        animation_opacity.each(function()
        {
            let $this = $(this);
            let this_top = $this.offset().top;

            if(window_top > this_top - 700 && window_top < this_top + $this.height() + 700)
            {
                $this.removeClass('disappear');
                $this.addClass('appear');
            }
        });
    }

    function animationTranslate()
    {
        animation_translate.each(function()
        {
            let $this = $(this);
            let this_top = $this.offset().top;

            if(window_top > this_top - 700 && window_top < this_top + $this.height() + 700)
            {
                $this.removeClass('disappear');
                $this.addClass('appear');
            }
        });
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

    // Fonctions section about
    function About_blockTitleAnimation()
    {
        about_blockTitles.each(function()
        {
            let blockTitle = $(this);
            let blockTitleOffset = blockTitle.offset().top;
            let blockTitleHeight = blockTitle.height();
            let blockTitleBottom = blockTitleOffset + blockTitleHeight;

            if($(window).scrollTop() >= blockTitleBottom - 750)
            {
                if(!blockTitle.hasClass('active'))
                {
                    blockTitle.addClass('active');
                }
            }
            else 
            {
                if(blockTitle.hasClass('active'))
                {
                    blockTitle.removeClass('active');
                }
            }
        });
    }

    function About_skillAnimation()
    {
        if($(window).scrollTop() >= about_skillsContainer.offset().top - 750)
        {
            if(!about_skillsContainer.hasClass('active'))
            {
                About_animateSkills();
            }
            about_skillsContainer.addClass('active');
        }
        else 
        {
            if(about_skillsContainer.hasClass('active'))
            {
                About_hideSkills();
            }
            about_skillsContainer.removeClass('active');
        }
    }

    function About_parallaxAnimation() 
    {
    
    
        // Le parallax est sur notre écran
        if (window_top + window_height >= about_parallax_top && window_top <= about_parallax_top + about_parallax_height)
        {
            
            let scrolled = (window_top - about_parallax_top) + window_height;
            let totalScroll = about_parallax_height + window_height;
            let scrollRatio = scrolled / totalScroll;
    
            let parallax_offset = scrollRatio * 40;
    
            parallax_offset = Math.min(40, Math.max(0, parallax_offset));
            about_parallax.css('top', parallax_offset - 20 + '%')

        
        }

        // Le titre est sur notre écran distancé de 100px du bas et du haut de notre fenêtre
        if (window_top + window_height >= about_title_top + 200 && window_top <= about_title_top + about_title_height - 200)
        {
            about_title.addClass('active');
        }
        else 
        {
            about_title.removeClass('active');
        }
        if (window_top + window_height >= about_subtitle_top + 200 && window_top <= about_subtitle_top + about_subtitle_height - 200)
        {
            about_subtitle.addClass('active');
        }
        else 
        {
            about_subtitle.removeClass('active');
        }

        
    }

    function About_animateSkills() 
    {
    
        about_skills.each(function() {
            let skill = $(this);
            let skillValue = skill.find('.pourcentage');
            let skillProgression = skill.find('.progression');
            let skillValueWidth = skillValue.data('value');
    
            setTimeout(function() {
                let i = 0;
                skillProgression.css('width', skillValueWidth + '%');
                let interval = setInterval(function() {
                    if (i <= skillValueWidth) {
                        skillValue.text(i + '%');
                        i++;
                    } else {
                        clearInterval(interval);
                    }
                }, 10);

            }, about_timer);
    
            about_timer += 100;
        });
    }
    
    function About_hideSkills()
    {
        about_skills.each(function()
        {
            let skill = $(this);
            let skill_value = skill.find('.pourcentage');
            let skill_progression = skill.find('.progression');

            skill_value.text('0%');

            skill_progression.css('width', '0%');
        });
    }

    // Fonctions section home
    function Home_scroll()
    {
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



        // Vérifier si le parallaxe est sur notre écran
        if (window_top + window_height > home_parallax_top && window_top < home_parallax_top + home_parallax_height) {
        

            // Calculer la progression du défilement par rapport au parallaxe
            let scroll_within_parallax = window_top - home_parallax_top;
            let scroll_ratio = scroll_within_parallax / home_parallax_height;
            home_parallax.css('top', scroll_ratio * 25 + '%');
        }

        home_section.each(function()
        {
            if (window_top + window_height >= $(this).offset().top + 100 && window_top <= $(this).offset().top + $(this).height() - 100)
            {
                $(this).addClass('active');
            }
        });
        if (window_top + window_height >= home_title.offset().top + 200 && window_top <= home_title.offset().top + home_title.height() - 200)
        {
            home_title.addClass('active');
        }
        if (window_top + window_height >= home_subtitle.offset().top + 200 && window_top <= home_subtitle.offset().top + home_subtitle.height() - 200)
        {
            home_subtitle.addClass('active');
        }
        
    }

    // Fonctions section contact
    function ContactScroll()
    {

        slide_title.each(function()
        {
            slide_top = $(this).offset().top;
            slide_bottom = slide_top + $(this).height();
            if (window_top + window_height >= slide_top && window_top <= slide_bottom) 
            {
                let scrollPercent = (window_top + window_height - slide_top) / (slide_bottom - slide_top + window_height);
                scrollPercent = Math.max(0, Math.min(1, scrollPercent));
                let translateValue = -20 * scrollPercent;
                let group = $(this).find('.group');
                group.css('transform', 'translate(' + translateValue + '%, 0)');
            }
        });
    }
});