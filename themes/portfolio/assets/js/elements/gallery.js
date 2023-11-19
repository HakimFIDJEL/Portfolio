$(document).ready(function()
{
    let gallery = $('aside#gallery');
    let thumbnail_container = $(".thumbnail-container");
    let tab = [];
    let followCursor = $('aside#gallery .follow-cursor');

    // A mettre dans about.js
    $(document).on('click', '.image-container .image', function()
    {
        let images_url = [];
        let images = $(this).parent().find('.image');
        images.each(function()
        {
            images_url.push($(this).css('background'));
        });
        OpenGallery(images_url);
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
        let index = $(".thumbnail.active").attr('data-ref');
        let parent = $(this).parent();
        if(parent.hasClass('prev'))
        {
            index--;
            if(index < 0)
            {
                index = tab.length - 1;
            }
        }
        else
        {
            index++;
            if(index > tab.length - 1)
            {
                index = 0;
            }
        }
        DisplayImage(index);
    });

    // Fermeture de la gallerie
    $(document).on('click', 'aside#gallery .close, aside#gallery .cover', function()
    {
        CloseGallery();
    });


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
    
    //         if (distance < 75) {
    //             // Réduire la distance de translation pour un mouvement plus subtil
    //             let translateX = deltaX / 5;
    //             let translateY = deltaY / 5;


                
    //                 $this.css({
    //                     'transform': `translate(${translateX}px, ${translateY}px)`,
    //                     'transition': 'background-color 0.3s ease-out'  // Pas de transition pour le suivi instantané
    //                 });
    
                
    //         } else {
    //             $this.css({
    //                 'transform': 'translate(0px, 0px)',
    //                 'transition': 'transform 0.3s ease-out, background-color 0.3s ease-out'  // Remettre la transition pour le retour en douceur
    //             });
    //         }
    //     });
    // });



    function OpenGallery(images)
    {
        tab = images;
        gallery.css('display', 'flex');
    
        setTimeout(function()
        {
            gallery.addClass('active');
            InitialiseThumbnails(tab);
            DisplayImage(0);
        }, 5);
    }

    function CloseGallery()
    {
        gallery.removeClass('active');
        setTimeout(function()
        {
            thumbnail_container.html('');
            gallery.css('display', 'none');
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

});

