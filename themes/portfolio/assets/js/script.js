var body = $('body');
var header = $('header');

$(document).ready(function()
{
   

    $(window).on('wheel', function(e)
    {
        toggleHeader();


    });


    $(window).on('scroll', function()
    {
        let section_home = $('section#home');
        let section_last_projects = $('section#last-projects');
        let section_all_projects = $('section#all-projects');


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
        else 
        {
            headerDark();
        }
        
       
    });
});

function toggleHeader()
{
    if(body.css('overflow') == 'hidden')
    {
        header.removeClass('appear');
        header.addClass('disappear');
    }
    else {
        header.removeClass('disappear');
        header.addClass('appear');
    }
}

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

