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

    function LastProjectsDisappear(index)
    {
        const switch_container = document.getElementById('switch-container-last-projects');
        // const switch_container_children = switch_container.children;
        const switch_container_children = switch_container.querySelectorAll('.switch-box');
        const switch_container_child = switch_container_children[index];

        switch_container_child.children[0].classList.remove('active');


    }

    function LastProjectsAppear(index)
    {
        const switch_container = document.getElementById('switch-container-last-projects');
        // const switch_container_children = switch_container.children;
        const switch_container_children = switch_container.querySelectorAll('.switch-box');
        const switch_container_child = switch_container_children[index];

        // wait 0.1s
        setTimeout(function(){
            switch_container_child.children[0].classList.add('active');
        }, 100);
    }


    
    const switch_container_last_projects = document.getElementById('switch-container-last-projects');
    const snapPoints = [...switch_container_last_projects.children].map(child => child.offsetLeft);
    const dummyProjects = document.querySelectorAll('.dummy-project');
    const progression_container = document.getElementById('progression-container');
    let isScrolling;
    var temp_SnapPoint = 0;

    function onScrollEnd() {
        const currentScrollPos = switch_container_last_projects.scrollLeft;
        var currentSnapPoint = snapPoints.findIndex(point => point > currentScrollPos);
        if(currentSnapPoint < 0) {
            currentSnapPoint = snapPoints.length;
        }
        console.log("Current snap point index:", currentSnapPoint - 1);
        isScrolling = false;
        if(currentSnapPoint - 1 != temp_SnapPoint) {

            progression_container.innerText = `${currentSnapPoint} / ${snapPoints.length}`;
            window.scrollTo({
                top: dummyProjects[currentSnapPoint -1].offsetTop - 20,
                behavior: 'smooth'
            })
            LastProjectsDisappear(temp_SnapPoint);
            LastProjectsAppear(currentSnapPoint - 1);
            temp_SnapPoint = currentSnapPoint - 1;

        }
    }

    function switchFunction(e) {
        if(isElementInViewport(switch_container_last_projects)) {
            if(!switch_container_last_projects.classList.contains('active')) {
                switch_container_last_projects.classList.add('active');
            }
            if (!isScrolling) {
                switch_container_last_projects.scrollBy({
                    left: e.deltaY,
                    behavior: 'smooth'
                });
                isScrolling = true;
            }
            clearTimeout(isScrolling);
            isScrolling = setTimeout(onScrollEnd, 150); // Temps de réaction plus court
        }
        else 
        {
            if(switch_container_last_projects.classList.contains('active')) {
                switch_container_last_projects.classList.remove('active');
            }
        
        }
    }

   

      

      


    window.addEventListener('wheel', switchFunction, { passive: false });
    switch_container_last_projects.addEventListener('scroll', onScrollEnd);

    window.addEventListener('scroll', scrollFunction);
    
    
});