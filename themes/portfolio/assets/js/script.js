var body = $('body');
var header = $('header');
var last_projects_status = true;

$(document).ready(function()
{
   
    


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


        animationOpacity();
        animationTranslate();

       


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

function animationOpacity()
{
    let animation_opacity = $('.animation-opacity');
    let window_top = $(window).scrollTop();

    animation_opacity.each(function()
    {
        let $this = $(this);
        let this_top = $this.offset().top;

        if(window_top > this_top - 700 && window_top < this_top + $this.height() + 700)
        {
            $this.removeClass('disappear');
            $this.addClass('appear');
        }
        else 
        {
            $this.removeClass('appear');
            $this.addClass('disappear');
        }
    });
}

function animationTranslate()
{
    let animation_translate = $('.animation-translate');
    let window_top = $(window).scrollTop();

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

