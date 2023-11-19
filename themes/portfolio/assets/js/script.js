var body = $('body');
var header = $('header');
var last_projects_status = true;

$(document).ready(function()
{
   
    let followCursor = $('.follow-cursor');
    $(window).on('mousemove', function(e) {
        let mouseX = e.pageX;
        let mouseY = e.pageY;

        followCursor.each(function() {
            let $this = $(this);
            let thisX = $this.offset().left + $this.width() / 2;
            let thisY = $this.offset().top + $this.height() / 2;

            let deltaX = mouseX - thisX;
            let deltaY = mouseY - thisY;
            let distance = Math.sqrt(deltaX * deltaX + deltaY * deltaY);

            if(distance < 100) {
                // Réduire la distance de translation pour un mouvement plus subtil
                let translateX = deltaX / 5;
                let translateY = deltaY / 5;

                $this.css('transform', `translate(${translateX}px, ${translateY}px)`);
            } else {
                $this.css('transform', 'translate(0px, 0px)');
            }
        });
    });


    $(window).on('scroll', function()
    {
        let section_home = $('section#home');
        let section_last_projects = $('section#last-projects');
        let section_all_projects = $('section#all-projects');
        let contact = $('section#contact');

        let switch_container = $('#last-projects .switch-container');

        setTimeout(function()
        {
            if(switch_container.hasClass('active'))
            {
                header.css('top', '0px');
                header.removeClass('appear');
                header.addClass('disappear');
            }
            else 
            {
                header.css('top', '-100px');
                header.removeClass('disappear');
                header.addClass('appear');
            }
        }, 0);

       


        if($(window).scrollTop() > section_home.offset().top  && $(window).scrollTop() < section_home.offset().top + section_home.height() - 100)
        {
            headerDark();
        }
        else if($(window).scrollTop() > section_last_projects.offset().top  && $(window).scrollTop() < section_last_projects.offset().top + section_last_projects.height() - 100)
        {
            headerLight();
        }
        else if($(window).scrollTop() > section_all_projects.offset().top  && $(window).scrollTop() < section_all_projects.offset().top + section_all_projects.height() - 100)
        {
            headerLight();
        }
        else if($(window).scrollTop() > contact.offset().top  && $(window).scrollTop() < contact.offset().top + contact.height() - 100)
        {
            headerLight();
        }
        else 
        {
            headerDark();
        }
        
       
    });
});


function headerLight()
{
    header.find('a').css('color', '#fff');
    header.find('svg path').css('fill', '#fff');
}

function headerDark()
{
    header.find('a').css('color', '#333333');
    header.find('svg path').css('fill', '#333333');
}

function deactivateLastProjects()
{
    last_projects_status = false;
}
function activateLastProjects()
{
    last_projects_status = true;
}

