$(document).ready(function()
{
    let gallery = $('aside#gallery');
    let thumbnail_container = $(".thumbnail-container");
    let tab = [];
    let followCursor = $('aside#gallery .follow-cursor');

    $(document).on('keydown', function(e)
    {
        if(gallery.hasClass('active'))
        {
            if(e.keyCode == 27)
            {
                CloseGallery();
            }
            else if(e.keyCode == 37)
            {
                prevImage();
            }
            else if(e.keyCode == 39)
            {
                nextImage();
            }

        }
    });


    // A mettre dans about.js
    $(document).on('click', '.image-container .image', function()
    {
        let images_url = [];

        let index = $(this).index();

        let images = $(this).parent().find('.image');
        images.each(function()
        {
            images_url.push($(this).css('background'));
        });
        OpenGallery(images_url, index);
    });

    // Changement d'imager au click sur les thumbnails
    $(document).on('click', 'aside#gallery .thumbnail', function()
    {
        let index = $(this).attr('data-ref');
        DisplayImage(index);
    });

    // Changement d'image au click sur les boutons de navigation
    $(document).on('click', 'aside#gallery .arrow', function()
    {
        let parent = $(this).parent();
        if(parent.hasClass('prev'))
        {
            prevImage();
        }
        else
        {
            nextImage();
        }
    });

    // Fermeture de la gallerie
    $(document).on('click', 'aside#gallery .close, aside#gallery .cover', function()
    {
        CloseGallery();
    });


    function OpenGallery(images, index)
    {
        tab = images;
    
        
        gallery.addClass('active');
        InitialiseThumbnails(tab);
        DisplayImage(index);
    }

    function CloseGallery()
    {
        gallery.removeClass('active');
        setTimeout(function()
        {
            thumbnail_container.html('');
        }, 500);
    }

    function InitialiseThumbnails(tab)
    {
        let index = 0;
        tab.forEach(element => {
            let thumbnail = $('<div data-ref="'+index+'" class="thumbnail"></div>');
            thumbnail.css('background', element);
            thumbnail_container.append(thumbnail);
            index++;
        });
    }

    function DisplayImage(index)
    {
        let image = $(".image-display")
        image.css('background', tab[index]);
        $(".thumbnail.active").removeClass('active');
        $(".thumbnail[data-ref='"+index+"']").addClass('active');

    }   

    function prevImage()
    {
        let index = $(".thumbnail.active").attr('data-ref');
        index--;
        if(index < 0)
        {
            index = tab.length - 1;
        }
        DisplayImage(index);
    }

    function nextImage()
    {
        let index = $(".thumbnail.active").attr('data-ref');
        index++;
        if(index > tab.length - 1)
        {
            index = 0;
        }
        DisplayImage(index);
    }

});

