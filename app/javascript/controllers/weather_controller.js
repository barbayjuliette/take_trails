import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {
  static targets = ["infos", "form"]
  connect() {
    console.log(this.contentTarget)
  }
}

// let city = document.querySelector("#city-name");

// // output
// let weatherDescription = document.querySelector("#weather-description");
// let temp = document.querySelector("#temp")
// let windSpeed = document.querySelector("#wind-speed");
// let humidity = document.querySelector("#humidity");


// function getWeatherAPI(){
//   let apiURL = `https://api.openweathermap.org/data/2.5/weather?q=${city.value}&units=metric&APPID=6157d0b45dbc65d57d7bcb4569934b10`;
//   fetch(apiURL)
//   .then(response => response.json())
//   .then((data)=> {
//       weatherDescription.innerHTML = data.weather[0].description;
//       temp.innerHTML = `${data.main.temp}°C`;
//       windSpeed.innerHTML = `${data.wind.speed}m/s`;
//       humidity.innerHTML = `${data.main.humidity}%`
//   })
}
  // connect() {
  //   console.log("controller connected")
  // }

//   displayForm() {
//     this.infosTarget.classList.add("d-none")
//     this.formTarget.classList.remove("d-none")
//   }
// }
