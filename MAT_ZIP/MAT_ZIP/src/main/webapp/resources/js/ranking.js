$(document).ready(function() {
    $('#r1').on('click', function(event) {
        event.preventDefault();
        $('#result').empty();
        $.ajax({
            url : "point/ranking",
            success : function(x) {
                $('#result').append(x);
                $('#result .owl-carousel').owlCarousel({});
            },
            error: function(error) {
                console.log("Error in b1 request: ", error);
            }
        });
    });

    $('#r2').on('click', function(event) {
        event.preventDefault();
        $('#result').empty();
        $.ajax({
            url : "point/rankingwoman",
            success : function(x) {
                $('#result').append(x);
                $('#result .owl-carousel').owlCarousel({});
            },
            error: function(error) {
                console.log("Error in b2 request: ", error);
            }
        });
    });

    $('#r3').on('click', function(event) {
        event.preventDefault();
        $('#result').empty();
        $.ajax({
            url : "point/rankingman",
            success : function(x) {
                $('#result').append(x);
                $('#result .owl-carousel').owlCarousel({});
            },
            error: function(error) {
                console.log("Error in b3 request: ", error);
            }
        });
    });
});