
// const api_key = "6157d0b45dbc65d57d7bcb4569934b10"


// // api.openweathermap.org/data/2.5/forecast/daily?lat=${lat}&lon=${lon}&cnt=${cnt}&appid=${api_key}

// window.addEventListener('load', () => {
//   let long;
//   let lat;
//   if (navigator.geolocation) {
//     navigator.geolocation.getCurrentPosition((position) => {

//     //   lon = position.coords.longitude;
//     //   lat = position.coords.latitude;
//     //   const base = `https://api.openweathermap.org/data/2.5/forecast/daily?lat=${lat}&lon=${lon}&cnt=${cnt}&appid=${api_key}`;
//     //   console.log(base);
//     //   fetch(base).then((response) => {
//     //     return response.json();
//     //   });
//     });
//   }
// });

// input
let city = document.querySelector("#city-name");

// output
let weatherDescription = document.querySelector("#weather-description");
let temp = document.querySelector("#temp")
let windSpeed = document.querySelector("#wind-speed");
let humidity = document.querySelector("#humidity");


function getWeatherAPI(){
    let apiURL = `https://api.openweathermap.org/data/2.5/weather?q=${city.value}&units=metric&APPID=6157d0b45dbc65d57d7bcb4569934b10`;
    fetch(apiURL)
    .then(response => response.json())
    .then((data)=> {
        weatherDescription.innerHTML = data.weather[0].description;
        temp.innerHTML = `${data.main.temp}°C`;
        windSpeed.innerHTML = `${data.wind.speed}m/s`;
        humidity.innerHTML = `${data.main.humidity}%`
    })
}
