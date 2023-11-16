$(document).ready(function()
{
    let groups = $(".group-container");

    // headerLight();


    $(document).on('click', "#all-projects .selected", function()
    {
        let select = $(this);
        let options_container = select.parent().find('.options-container');

        if (select.hasClass('open'))
        {
            select.removeClass('open');
            select.addClass('closed');

            options_container.removeClass('appear');
            options_container.addClass('disappear');
        }
        else 
        {
            select.removeClass('closed');
            select.addClass('open');

            options_container.removeClass('disappear');
            options_container.addClass('appear');
        }
    });

    $(document).on('click', "#all-projects .option", function()
    {
        let option = $(this);
        let options = option.parent().find('.option');
        let select = option.parent().parent().find('.selected');
        let text = select.find('.text');
        let options_container = option.parent();

        text.text(option.text());

        select.removeClass('open');
        select.addClass('closed');

        options_container.removeClass('appear');
        options_container.addClass('disappear');


        setTimeout(function()
        {
            options.each(function()
            {
                $(this).removeClass('hide');
                if($(this).text() == option.text())
                {
                    $(this).addClass('hide');
                }
            });
        }, 200);

        groups.each(function() {
            let group = $(this);

            
            // Convertir la valeur de l'attribut data-cat en tableau JavaScript
            let categories = JSON.parse(group.attr('data-cat'));
            
            // Vérifier si option.text() fait partie de ce tableau
            if(categories.includes(option.data('cat')) || option.data('cat') == 'ALL') {
                group.css('display', 'flex');
                group.removeClass('disappear');
                group.removeClass('appear');



                
            } else {
                group.removeClass('appear');
                group.addClass('disappear');

                setTimeout(function()
                {
                    group.css('display', 'none');
                }, 200);
                
            }

            setTimeout(function()
            {
                checkOnScreen();
            }, 200);
        });

    });


    function checkOnScreen()
    {
        groups.each(function()
        {
            let group = $(this);
            let groupTop = group.offset().top;

            if($(window).scrollTop() > groupTop - 600 && $(window).scrollTop() < groupTop + group.height() + 600)
            {
                group.removeClass('disappear');
                group.addClass('appear');
            }
            else 
            {
                
            }
        });
    }



    $(window).on('scroll', function(e)
    {
        checkOnScreen();
    });
});