$(document).ready(function() {
    $(".tweet-image").click(function() {
        var clickedImageSrc = $(this).attr("src");
        $("#enlargedImage").attr("src", clickedImageSrc);
        $("#enlargedImageContainer").show();
    });

    // もし拡大表示をクリックしたら、非表示にするなら以下のコードも追加してください。
    $("#enlargedImageContainer").click(function() {
        $(this).hide();
    });
});