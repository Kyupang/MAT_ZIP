$(document).ready(function() {
    $('#b1').click(function(event) {
        event.preventDefault();
        $('#result').empty();
        $.ajax({
            url : "point/ranking",
            success : function(x) {
                $('#result').append(x);

                // 여기에 추가된 HTML 요소에 대한 처리를 추가합니다.
                // 예를 들어, owlCarousel을 초기화하는 코드를 추가합니다.
                $('#result .owl-carousel').owlCarousel({
                    // owlCarousel에 대한 옵션을 여기에 설정할 수 있습니다.
                    // 예시: loop: true, items: 1 등
                });
            }
        })
    })
});