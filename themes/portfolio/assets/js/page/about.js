$(document).ready(function()
{
    // TODO : Mettre un effet Parallax à la place de la page hero about


    let skill_container = $("#about .skills-container");
    let skills = $("#about .skills-container .skill");
    let blockTitles = $("#about .block-group-title");

    

    $(document).on('click', '.accordeon .arrow', function()
    {
        let accordeon = $(this).parent().parent();
        let accordeons = $(".accordeon");
        let content = accordeon.find('.group-content');
        
        
        accordeons.each(function()
        {
            if ($(this).hasClass('active') && this != accordeon[0])
            {
                $(this).removeClass('active');
                $(this).find('.group-content').animate({'height': '0px'}, 400);
            }
        });

        if (accordeon.hasClass('active'))
        {
            accordeon.removeClass('active');
            content.animate({
                'height': '0px',
            }, 400);
        }
        else
        {
            content.css('height', 'auto');
            let height = content.height();
            content.css('height', '0px');

            accordeon.addClass('active');
            content.animate({
                'height': height + 'px',
            }, 400);
        }
    });






    $(window).on('scroll', function(e)
    {

        blockTitleAnimation();
        skillAnimation();
        parallaxAnimation();
        
    });

    function animateSkills() {
        let timer = 0;
    
        $('.skill').each(function() {
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

            }, timer);
    
            timer += 100;
        });
    }
    
    function hideSkills()
    {
        skills.each(function()
        {
            let skill = $(this);
            let skill_value = skill.find('.pourcentage');
            let skill_progression = skill.find('.progression');
            let skill_value_width = skill_value.data('value');

            skill_value.text('0%');

            skill_progression.css('width', '0%');
        });
    }

    function skillAnimation()
    {
        if($(window).scrollTop() >= skill_container.offset().top - 750)
        {
            if(!skill_container.hasClass('active'))
            {
                animateSkills();
            }
            skill_container.addClass('active');
        }
        else 
        {
            if(skill_container.hasClass('active'))
            {
                hideSkills();
            }
            skill_container.removeClass('active');
        }
    }
    function blockTitleAnimation()
    {
        blockTitles.each(function()
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

    function parallaxAnimation() {
        let window_top = $(window).scrollTop();
        let window_height = $(window).height();
        let parallax_top = $("#about .hero-container").offset().top;
        let parallax_height = $("#about .hero-container").height();

        let parallax = $("#about .parallax");

        let title = $("#about .group-title .title");
        let title_top = title.offset().top;
        let title_height = title.height();

        let subtitle = $("#about .group-title .subtitle");
        let subtitle_top = subtitle.offset().top;
        let subtitle_height = subtitle.height();

     
    
        let max = 40;
    
        // Le parallax est sur notre écran
        if (window_top + window_height >= parallax_top && window_top <= parallax_top + parallax_height)
        {
            
            let scrolled = (window_top - parallax_top) + window_height;
            let totalScroll = parallax_height + window_height;
            let scrollRatio = scrolled / totalScroll;
    
            let parallax_offset = scrollRatio * max;
    
            parallax_offset = Math.min(max, Math.max(0, parallax_offset));
            parallax.css('top', parallax_offset - 20 + '%')

        
        }

        // Le titre est sur notre écran distancé de 100px du bas et du haut de notre fenêtre
        if (window_top + window_height >= title_top + 200 && window_top <= title_top + title_height - 200)
        {
            title.addClass('active');
        }
        else 
        {
            title.removeClass('active');
        }
        if (window_top + window_height >= subtitle_top + 200 && window_top <= subtitle_top + subtitle_height - 200)
        {
            subtitle.addClass('active');
        }
        else 
        {
            subtitle.removeClass('active');
        }

        
    }
    
});