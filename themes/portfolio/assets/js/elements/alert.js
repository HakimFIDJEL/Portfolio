$(document).ready(function()
{
    let alert = $('.alert-container');
    $(document).on('click', '.alert-container button', function()
    {
        alert.removeClass('active');
    });

    
});

function showAlert()
{
    console.log('On appelle showAlert');
    let alert = $('.alert-container');
    alert.addClass('active');
    setTimeout(function()
    {
        alert.removeClass('active');
    }, 4000);
}