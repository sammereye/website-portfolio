$(document).ready(function() {
    document.querySelectorAll('a[href^="#"]').forEach(function (anchor) {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();

            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        });
    });

    $('.noSource').on('mouseover', function() {
        $(this).find('.tooltip').fadeIn();
    });

    $('.noSource').on('mouseleave', function() {
        $(this).find('.tooltip').fadeOut();
    });

    $('.submitForm').click(function() {
        var valid = true;
        $('.emailRequired, .nameRequired, .messageRequired').css('display', 'none');

        if ($('#userEmail').val() == '') {
            $('.emailRequired').css('display', 'inline');
            valid = false;
        }

        if ($('#userName').val() == '') {
            $('.nameRequired').css('display', 'inline');
            valid = false;
        }

        if ($('#userMessage').val() == '') {
            $('.messageRequired').css('display', 'inline');
            valid = false;
        }

        var message = {
            email: $('#userEmail').val(),
            name: $('#userName').val(),
            message: $('#userMessage').val()
        }

        if (valid) {
            $.ajax({
                url: '/sendMessage/',
                type: 'POST',
                dataType: 'json',
                data: {'message': message},
                success: function(result) {
                    $('.messageSent').animate({top: '10px', opacity: 1}, 'slow');

                    $('#userEmail, #userName, #userMessage').val('');

                    setTimeout(function() {
                        $('.messageSent').animate({top: '-50px', opacity: 0}, 'slow');
                    }, 3000);
                }
            });
        }
    });
});