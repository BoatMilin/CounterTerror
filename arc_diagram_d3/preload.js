$(document).ready(function () {
    $(window).load(function () {
        $('.preload').click(function() {
           $('.preload').hide();
        });
        var positionYear = $("#slider").position();
        var positionTitle = $("#sankeyTitle").position();
        var positionText = $('#svg2').position();
        $('#labelYear').css({
            top: positionYear.top + 10,
            left: positionYear.left + 450
        })
        $('#labelRegion').css({
            top: positionTitle.top -150,
            left: positionTitle.left + 40
        })
        $('#labelContinent').css({
            top: positionTitle.top - 70,
            left: positionTitle.left + 1125
        })
        $('#labelGroup').css({
            top: positionTitle.top + 120,
            left: positionTitle.left + 1550
        })
        $('#labelText').css({
            top: positionText.top + 50,
            left: positionText.left + 20
        })
    });
});
