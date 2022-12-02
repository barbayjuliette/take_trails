import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    this.swiper = new Swiper(this.element, {
      centeredSlides: true,
      loop: true,
      speed: 500,
      slidesPerView: 2,
      spaceBetween: 20,
      autoplay: {
          delay: 3000,
      },
      navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
      },
      breakpoints: {
          320: {
          slidesPerView: 1,
          },

          640: {
              slidesPerView: 1,
          },
          768: {
              slidesPerView: 1.25,
          },
          1080: {
              slidesPerView: 1.25,
          },
          1280: {
              slidesPerView: 1.75,
          },
      },
  });
  }

  disconnect() {
    this.swiper.destroy()
  }
}
