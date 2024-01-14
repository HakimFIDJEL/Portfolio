document.addEventListener('DOMContentLoaded', function() {


    setTimeout(function(){
        
        $("#project .title").addClass('active');
        $("#project .subtitle").addClass('active');
    }, 2000);


    const header = document.getElementById("header");
    const project_description = document.getElementById("project-description");
    const first_question      = document.getElementById("first-question");
    const second_question     = document.getElementById("second-question");
    const first_answer        = document.getElementById("first-answer");
    const second_answer       = document.getElementById("second-answer");
    const circle              = $('.circle');
    const dark_container      = document.getElementById("dark-container");
    const light_container     = document.getElementById("light-container");
    const footer              = document.getElementById("footer");
    const light_container_height = light_container.offsetHeight;
    let observer = new IntersectionObserver(handleIntersection);

    function scrollFunction() 
    {

        // Autres fonctions
        if(document.documentElement.scrollTop > 0)
        {
            if(!header.classList.contains("active"));
            header.classList.add("active");
        }
        else 
        {
            if(header.classList.contains("active"));
            header.classList.remove("active");
        }
        if(isElementInViewport(project_description))
        {
            updateBackgroundSize(project_description);
        }
        if(isElementInViewport(first_question) && !first_question.classList.contains("active"))
        {
            first_question.classList.add("active");
        }
        if(isElementInViewport(second_question) && !second_question.classList.contains("active"))
        {
            second_question.classList.add("active");
        }
        if(isElementInViewport(first_answer) && !first_answer.classList.contains("active"))
        {
            first_answer.classList.add("active");
        }
        if(isElementInViewport(second_answer) && !second_answer.classList.contains("active"))
        {
            second_answer.classList.add("active");
        }
        if(isElementInViewport(circle[0]) && !circle.hasClass('active'))
        {
            animationCircle();
        }
        if(isWindowInsideElement(dark_container) || isElementInViewport(footer))
        {
            console.log("dark");
            if(header.classList.contains("dark"))
            {
                header.classList.remove("dark");
                header.classList.add("light");
            }
        }
        else 
        {
            if(header.classList.contains("light"))
            {
                header.classList.remove("light");
                header.classList.add("dark");
            }
        }
        

    }

    function handleIntersection(entries, observer) {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            // `dark-container` est maintenant visible dans la fenêtre
            // Tu peux ici changer le positionnement ou effectuer d'autres actions
            console.log('dark-container est visible');
            light_container.style.position = 'fixed';
            light_container.style.bottom = '0';
            dark_container.style.marginTop = light_container_height + 'px';
          } else {
            // `dark-container` n'est plus visible
            console.log('dark-container n\'est plus visible')
            light_container.style.position = 'relative';
            light_container.style.bottom = 'auto';
            dark_container.style.marginTop = '0';
          }
        });
      }
      

    function isWindowInsideElement(element) {
        var rect = element.getBoundingClientRect();
        return (
            rect.top <= 0 &&
            rect.left <= 0 &&
            rect.bottom >= (window.innerHeight || document.documentElement.clientHeight) &&
            rect.right >= (window.innerWidth || document.documentElement.clientWidth)
        );
    }

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

    function animationCircle()
    {
        if(!circle.hasClass('active'))
        {
            circle.addClass('active');
            let timer = 0;
            let grade = circle.data('grade');
            setInterval(function()
            {
                if(timer < grade)
                {
                    timer++;
                    circle.css('--p', timer);
                    circle.find('.grade').html(timer + '%');
                }
            }, timer);
        }
    }


    window.onscroll = function() {scrollFunction()};
    observer.observe(dark_container);

});

