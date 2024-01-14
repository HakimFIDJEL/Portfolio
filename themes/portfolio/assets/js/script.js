var body = $('body');
var header = $('header');
var last_projects_status = true;


// On document load
$(window).on('load', function()
{
    // $(window).scrollTop(0);

    setTimeout(function(){
        let preloader = $('aside.preloader');
        let delimiter = $('aside.preloader .delimiter');
        delimiter.remove();
        preloader.addClass('loaded');
        body.css('overflow-y', 'auto');
    }, 1000);

    setTimeout(function(){
        
        $("#home .title").addClass('active');
        $("#home .subtitle").addClass('active');
        $("#home .scroll-down").addClass('active');
        header.addClass('active');
    }, 1500);

});

$(document).ready(function()
{

    $(document).on('click', ".link-href", function()
    {
        let preloader = $('aside.preloader');
        let src = $(this).data('src');
        preloader.removeClass('loaded');
        setTimeout(function(){
            window.location.href = src;
        }, 600);

    });


    
    if(getOrientation() === 'landscape') {
        document.querySelectorAll('.follow-cursor').forEach(elem => {
            elem.addEventListener('mouseenter', function() {
                this.style.transform = 'scale(1.2)';
                setTimeout(() => {
                    this.style.transform = 'scale(1)';
                }, 100);
    
                const onMouseMove = (event) => {
                    const rect = this.getBoundingClientRect();
                    const deltaX = event.clientX - rect.left - this.offsetWidth / 2;
                    const deltaY = event.clientY - rect.top - this.offsetHeight / 2;
                    const distance = Math.sqrt(deltaX * deltaX + deltaY * deltaY);
    
                    if(distance < 100) {
                        this.style.left = deltaX + 'px';
                        this.style.top = deltaY + 'px';
                    } else {
                        this.style.left = '';
                        this.style.top = '';
                    }
                };
    
                this.addEventListener('mousemove', onMouseMove);
    
                this.addEventListener('mouseleave', () => {
                    this.removeEventListener('mousemove', onMouseMove);
                    this.style.left = '0px';
                    this.style.top = '0px';
                }, { once: true });
            });
        });
    }
    

    
    


});

function getOrientation()
{
    if(window.innerHeight > window.innerWidth) {
        return 'portrait';
    } else {
        return 'landscape';
    }
}

