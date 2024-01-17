$(document).ready(function()
{
    let groups = $(".group-container");


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

        // Selecteur
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

            let categories = JSON.parse(group.attr('data-cat'));
            
            if(categories.includes(option.data('cat')) || option.data('cat') == 'ALL') {
                if(group.css('visibility') == 'hidden')
                {
                    group.css('visibility', 'visible');
                    group.addClass('active');
                }
            } else {
                group.removeClass('active');

                setTimeout(function()
                {
                    group.css('visibility', 'hidden');
                }, 200);
                
            }

         
        });

    });

 
});