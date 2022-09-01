window.addEventListener("DOMContentLoaded", () => {
    // サムネイルのスライダー
    const thumbnail = new Swiper(".thumbnail", {
        freeMode: true,
        slidesPerView: 3,
        spaceBetween: 10,
        watchSlidesVisibility: true,
        watchSlidesProgress: true,
    });

    // メインのスライダー
    const slider = new Swiper(".slider", {
        thumbs: {
            swiper: thumbnail,
        },
    });
});