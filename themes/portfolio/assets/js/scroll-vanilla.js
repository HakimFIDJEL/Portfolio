// Vanilla JS

document.addEventListener('DOMContentLoaded', function() {



    const sections = document.querySelectorAll('section');

    function scrollFunction() 
    {
        const home_groupAbout = document.getElementById('home-group-about');
        const home_firstSpan = document.getElementById('home-first-span');
        const home_button = document.getElementById('home-group-know-more'); 

        // Section Home
        if (isElementInViewport(home_groupAbout) && !home_groupAbout.classList.contains('active')) {
            home_groupAbout.classList.add('active');
        }
        if (isElementInViewport(home_button) && !home_button.classList.contains('active')) {
            home_button.classList.add('active');
        }
        if(isElementInViewport(home_firstSpan)) {
            updateBackgroundSize(home_firstSpan);
        }

        if(getOrientation() == 'landscape') {
            // Section last projects
            const slide_title_last_projects = document.getElementById('slide-title-last-projects');
            const text_reveal_last_projects = document.getElementById('text-reveal-last-projects');
            const arrow_right_last_projects = document.getElementById('arrow-right-last-projects');
            if(isElementInViewport(slide_title_last_projects)) {
                updateTranslateX(slide_title_last_projects);
            }
            if(isElementInViewport(text_reveal_last_projects)) {
                updateBackgroundSize(text_reveal_last_projects);
            }
            if(isElementInViewport(arrow_right_last_projects) && !arrow_right_last_projects.classList.contains('active')) {
                arrow_right_last_projects.classList.add('active');
            }
            parallaxFunction();
        }


        // Section Portfolio
        const slide_title_portfolio = document.getElementById('slide-title-portfolio');
        const text_reveal_portfolio = document.getElementById('text-reveal-portfolio');
        const arrow_left_portfolio  = document.getElementById('arrow-left-portfolio');
        const arrow_right_portfolio = document.getElementById('arrow-right-portfolio');

        if(isElementInViewport(slide_title_portfolio)) {
            updateTranslateX(slide_title_portfolio);
        }
        if(isElementInViewport(text_reveal_portfolio))
        {
            updateBackgroundSize(text_reveal_portfolio);
        }

        if(isElementInViewport(arrow_left_portfolio) && !arrow_left_portfolio.classList.contains('active')) {
            arrow_left_portfolio.classList.add('active');
        }
        if(isElementInViewport(arrow_right_portfolio) && !arrow_right_portfolio.classList.contains('active')) {
            arrow_right_portfolio.classList.add('active');
        }

        // Section About
        const about_cta_reveal = document.getElementById('about-cta-reveal');
        const about_last_text = document.getElementById('about-last-text');
        const accordeon_container = document.getElementById('accordeon-container');
        const about_block_group_title_first = document.getElementById('about-block-group-title-first');
        const about_block_group_title_second = document.getElementById('about-block-group-title-second');
        const about_block_group_title_third = document.getElementById('about-block-group-title-third');
        const about_wrappers = document.getElementsByClassName('about-wrapper');
        const about_wrappers_subtitles = document.getElementsByClassName('about-wrapper-subtitle');
        if(isElementInViewport(about_cta_reveal)) {
            updateBackgroundSize(about_cta_reveal);
        }
        if(isElementInViewport(about_last_text)) {
            updateBackgroundSize(about_last_text);
        }
        if(isElementInViewport(accordeon_container)) {
            accordeonAppear(accordeon_container);
        }
        if(isElementInViewport(about_block_group_title_first) && !about_block_group_title_first.classList.contains('active')) {
            about_block_group_title_first.classList.add('active');
        }
        if(isElementInViewport(about_block_group_title_second) && !about_block_group_title_second.classList.contains('active')) {
            about_block_group_title_second.classList.add('active');
        }
        if(isElementInViewport(about_block_group_title_third) && !about_block_group_title_third.classList.contains('active')) {
            about_block_group_title_third.classList.add('active');
        }
        for (let i = 0; i < about_wrappers.length; i++) {
            const about_wrapper = about_wrappers[i];
            if(isElementInViewport(about_wrapper) && !about_wrapper.classList.contains('active')) {
                about_wrapper.classList.add('active');
            }
        }
        for (let i = 0; i < about_wrappers_subtitles.length; i++) {
            const about_wrapper_subtitle = about_wrappers_subtitles[i];
            updateBackgroundSize(about_wrapper_subtitle);
        }

        // Section Contact
        const slide_title_contact = document.getElementById('slide-title-contact');
        const text_reveal_contact = document.getElementById('text-reveal-contact');
        const arrow_right_contact = document.getElementById('arrow-right-contact');
        const contact_title = document.getElementById('contact-title');
        const contact_subtitle = document.getElementById('contact-subtitle');
        if(isElementInViewport(slide_title_contact)) {
            updateTranslateX(slide_title_contact);
        }
        if(isElementInViewport(text_reveal_contact)) {
            updateBackgroundSize(text_reveal_contact);
        }
        if(isElementInViewport(arrow_right_contact) && !arrow_right_contact.classList.contains('active')) {
            arrow_right_contact.classList.add('active');
        }
        if(isElementInViewport(contact_title) && !contact_title.classList.contains('active')) {
            contact_title.classList.add('active');
        }
        if(isElementInViewport(contact_subtitle) && !contact_subtitle.classList.contains('active')) {
            contact_subtitle.classList.add('active');
        }

    }


    // Fonctions utiles
    
    

    function isElementInViewport(element) {
        var rect = element.getBoundingClientRect();
        return (
            rect.top >= 0 &&
            rect.left >= 0 &&
            rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
            rect.right <= (window.innerWidth || document.documentElement.clientWidth)
        );
    }

    

    function updateBackgroundSize(element) {
        const rect = element.getBoundingClientRect();
        const windowHeight = window.innerHeight || document.documentElement.clientHeight;
        const percentVisible = Math.min(1, Math.max(0, (windowHeight - rect.top) / (0.5 * windowHeight)));
        element.style.backgroundSize = `${percentVisible * 100}% 100%`;
    }

    function updateTranslateX(element) {
        const element_children = element.children[0];
        const rect = element_children.getBoundingClientRect();
        const windowHeight = window.innerHeight || document.documentElement.clientHeight;
    
        const percentVisible = (rect.bottom >= 0 && rect.top <= windowHeight) ? 
            ((windowHeight - rect.bottom) / (rect.height + windowHeight)) : 1;
    
        const translateValue = Math.max(0, Math.min(1, percentVisible)) * -50;
    
        element_children.style.transform = `translate(${translateValue}%)`;
    }

    function accordeonAppear(element)
    {
        const accordeon_items = element.children;
        for (let i = 0; i < accordeon_items.length; i++) {
            const accordeon_item = accordeon_items[i];
            if(!accordeon_item.classList.contains('appear')) {
                accordeon_item.classList.add('appear');
            }
        }
    }

   

   

    const container = document.querySelector('#switch-container-last-projects'); 
    function isViewportInElement(element) {
        
        var rect = element.getBoundingClientRect();
        return (
            rect.top <= 0 &&
            rect.left <= 0 &&
            rect.bottom >= (window.innerHeight || document.documentElement.clientHeight) &&
            rect.right >= (window.innerWidth || document.documentElement.clientWidth)
        );
    }


    function calculerPositionViewport() {
        const rect = container.getBoundingClientRect();
        const topDistance = -rect.top;
        const totalScrollableDistance = rect.height - window.innerHeight;
        const scrollPercentage = (topDistance / totalScrollableDistance) * 100;
        return Math.min(100, Math.max(0, scrollPercentage));
    }


    var temp_child = -1;
    const progression = document.getElementById('progression-container');
    const scroll_container = document.getElementById('scroll-container');
    function parallaxFunction()
    {
        // if the window is fully in elem 
        if(isViewportInElement(container)) {

            
            if(!container.classList.contains('active')) {
                container.classList.add('active');
            }
            if(!scroll_container.classList.contains('active')) {
                scroll_container.classList.add('active');
            }

            // On récupère les enfants de container
            const container_children = container.children;

            // On récupère le pourcentage de scroll dans le container
            let position = calculerPositionViewport();

            // On récupère le nombre d'enfants
            let nb_children = container_children.length;
            

            // On récupère l'enfant a afficher en fonction de la position 
            let index = Math.floor(position / (100 / nb_children));
            

            if(index != temp_child) {


                // On affiche l'enfant et on cache les autres
                for (let i = 0; i < nb_children; i++) {
                    const container_child = container_children[i];
                    const content = container_child.children[0].children[0];
                    if(i == index) {
                        if(!content.classList.contains('active')) {
                            content.classList.add('active');
                        }
                    } else {
                        if(content.classList.contains('active')) {
                            content.classList.remove('active');
                        }
                    }
                }

                temp_child = index;
                progression.innerText = `${index + 1} / ${nb_children}`;



            }
            
           

          
           
           

            
            

        }

        // if the window is not fully in elem 
        else {
            temp_child = -1;
            if(container.classList.contains('active')) {
                container.classList.remove('active');
                // get all .content childs
                container.querySelectorAll('.content').forEach(function(element) {
                    if(element.classList.contains('active')) {
                        element.classList.remove('active');
                    }
                });
            }
            if(scroll_container.classList.contains('active')) {
                scroll_container.classList.remove('active');
            }
        }
    }

    

    function getOrientation()
    {
        if(window.innerHeight > window.innerWidth) {
            return 'portrait';
        } else {
            return 'landscape';
        }
    }
    
      

      
    

    window.addEventListener('scroll', scrollFunction);

    
    
});