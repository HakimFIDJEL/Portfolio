$(document).ready(function()
{   
    let followCursor = $('#contact .follow-cursor');
    let slide_title = $('#contact .slide-title');
    let last_scroll = 0;
    let groups = slide_title.find('.group');
    
    $(window).on('mousemove', function(e) {
        let mouseX = e.pageX;
        let mouseY = e.pageY;

        followCursor.each(function() {
            let $this = $(this);
            let thisX = $this.offset().left + $this.width() / 2;
            let thisY = $this.offset().top + $this.height() / 2;

            let deltaX = mouseX - thisX;
            let deltaY = mouseY - thisY;
            let distance = Math.sqrt(deltaX * deltaX + deltaY * deltaY);

            if(distance < 100) {
                // Réduire la distance de translation pour un mouvement plus subtil
                let translateX = deltaX / 5;
                let translateY = deltaY / 5;

                $this.css('transform', `translate(${translateX}px, ${translateY}px)`);
            } else {
                $this.css('transform', 'translate(0px, 0px)');
            }
        });
    });

   
    
  


});