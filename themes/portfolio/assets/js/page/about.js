$(document).ready(function()
{


    let skill_container = $("#about .skills-container");
    let skills = $("#about .skills-container .skill");
    let blockTitles = $("#about .block-group-title");

    let followCursor = $('.accordeon-container .follow-cursor');
    // $(window).on('mousemove', function(e) {
    //     let mouseX = e.pageX;
    //     let mouseY = e.pageY;
    
    //     followCursor.each(function() {
    //         let $this = $(this);
    //         let thisX = $this.offset().left + $this.width() / 2;
    //         let thisY = $this.offset().top + $this.height() / 2;
    
    //         let deltaX = mouseX - thisX;
    //         let deltaY = mouseY - thisY;
    //         let distance = Math.sqrt(deltaX * deltaX + deltaY * deltaY);
    
    //         if (distance < 100) {
    //             // Réduire la distance de translation pour un mouvement plus subtil
    //             let translateX = deltaX / 5;
    //             let translateY = deltaY / 5;


                
    //                 $this.css({
    //                     'transform': `translate(${translateX}px, ${translateY}px)`,
    //                     'transition': 'none'  // Pas de transition pour le suivi instantané
    //                 });
    
                
    //         } else {
    //             $this.css({
    //                 'transform': 'translate(0px, 0px)',
    //                 'transition': 'transform 0.3s ease-out'  // Remettre la transition pour le retour en douceur
    //             });
    //         }
    //     });
    // });
    




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
});