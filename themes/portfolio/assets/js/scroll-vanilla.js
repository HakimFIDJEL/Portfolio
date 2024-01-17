// Vanilla JS


document.addEventListener('DOMContentLoaded', function() {



    let current_section = "home";

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                current_section = entry.target.id;
                updateHeader(current_section);

            }
        });
    }, { threshold: 0.2 });

    // Ajouter chaque section à l'observer
    ["home", "about","last-projects", "all-projects", "contact"].forEach(section => {
        observer.observe(document.getElementById(section));
    });

    

    function updateHeader(current_section) {
        // Définition des classes pour chaque section
        const sectionClasses = {
            'home': 'dark',
            'about': 'dark',
            'all-projects': 'dark',
            'last-projects': 'light',
            'contact': 'light'
        };
    
        // Récupération de la classe à appliquer en fonction de la section actuelle
        const classToApply = sectionClasses[current_section] || 'light';
    
        // Mise à jour du header
        if(classToApply === 'dark') {
            headerDark();
        } else {
            headerLight();
        }
    
        // Mise à jour de la navigation active
        $(".nav li").removeClass('active');
        $(".nav li a[data-ref='" + current_section + "']").parent().addClass('active');
    }
    
    function headerDark() {
        header.removeClass('light').addClass('dark');
        burgerContainer.removeClass('light').addClass('dark');
    }
    
    function headerLight() {
        header.removeClass('dark').addClass('light');
        burgerContainer.removeClass('dark').addClass('light');
    }
    


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
        }


        // Section Portfolio
        const slide_title_portfolio = document.getElementById('slide-title-portfolio');
        const text_reveal_portfolio = document.getElementById('text-reveal-portfolio');
        const arrow_left_portfolio  = document.getElementById('arrow-left-portfolio');
        const arrow_right_portfolio = document.getElementById('arrow-right-portfolio');
        const groups = document.getElementsByClassName('group-container');

        if(isElementInViewport(slide_title_portfolio)) {
            updateTranslateX(slide_title_portfolio);
        }
        if(isElementInViewport(text_reveal_portfolio))
        {
            updateBackgroundSize(text_reveal_portfolio);
        }
        for (let i = 0; i < groups.length; i++) {
            const group = groups[i];
            if(isElementInViewport(group) && !group.classList.contains('active')) {
                group.classList.add('active');
            }
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
    const progression = document.getElementById('progression-container');
    const scroll_container = document.getElementById('scroll-container');
    var temp_child = -1;

    function isViewportInElement(element, scrollTop) {
        var top = $(element).offset().top;
        var bottom = top + $(element).outerHeight();
        var windowHeight = window.innerHeight || document.documentElement.clientHeight;
        
        return (
            scrollTop >= top &&
            scrollTop + windowHeight <= bottom
        );
    }
    

    function calculerPositionViewport(scrollTop) {
        var elementTop = $(container).offset().top;
        var elementHeight = $(container).outerHeight();
        var distanceParcourue = scrollTop - elementTop;
        var totalScrollableDistance = elementHeight - window.innerHeight;
        var scrollPercentage = (distanceParcourue / totalScrollableDistance) * 100;
        return Math.min(100, Math.max(0, scrollPercentage));
    }
    

    function parallaxFunction(scrollTop) {
        if(isViewportInElement(container, scrollTop)) {
            container.classList.add('active');
            scroll_container.classList.add('active');

            const container_children = container.children;
            let position = calculerPositionViewport(scrollTop);
            let nb_children = container_children.length;
            let index = Math.floor(position / (100 / nb_children));

            if(index != temp_child) {
                for (let i = 0; i < nb_children; i++) {
                    const container_child = container_children[i];
                    const content = container_child.children[0].children[0];
                    content.classList.toggle('active', i === index);
                }

                temp_child = index;
                progression.innerText = `${index + 1} / ${nb_children}`;
            }
        } else {
            temp_child = -1;
            container.classList.remove('active');
            scroll_container.classList.remove('active');
            container.querySelectorAll('.content').forEach(element => element.classList.remove('active'));
        }
    }

    lenis.on('scroll', (e) => {
        parallaxFunction(e.scroll);
    });



    function getOrientation()
    {
        if(window.innerHeight > window.innerWidth) {
            return 'portrait';
        } else {
            return 'landscape';
        }
    }
    
      
    
    
    const burgerContainer = $(".burger-container");
    const header = $('header');
    const nav_container = $('nav .container');
    const switch_container = $(".switch-container");
    function HeaderAnimation(e)
    {
        // On va vers le bas
        if(e.deltaY > 0)
        {
            if(header.hasClass('active'))
            {
                header.removeClass('active');
            }
            if(burgerContainer.hasClass('active') && !nav_container.hasClass('active'))
            {
                burgerContainer.removeClass('active');
            }
        }
        else 
        {
            if(!switch_container.hasClass('active'))
            {
                if(!header.hasClass('active'))
                {
                    header.addClass('active');
                }
            }
            else 
            {
                if(header.hasClass('active'))
                {
                    header.removeClass('active');
                }
            }
            if(!burgerContainer.hasClass('active'))
            {
                burgerContainer.addClass('active');
            }
        }
    }

    window.addEventListener('wheel', HeaderAnimation);
    window.addEventListener('scroll', scrollFunction);

    
    
});