
const api_key = "6157d0b45dbc65d57d7bcb4569934b10"


// api.openweathermap.org/data/2.5/forecast/daily?lat=${lat}&lon=${lon}&cnt=${cnt}&appid=${api_key}

window.addEventListener('load', () => {
  let lon;
  let lat;
  // Accesing Geolocation of User
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition((position) => {
      // Storing Longitude and Latitude in variables
      long = position.coords.longitude;
      lat = position.coords.latitude;
      const base = `https://api.openweathermap.org/data/2.5/forecast/daily?lat=${lat}&lon=${lon}&cnt=${cnt}&appid=${api_key}`;
      console.log(base);
      fetch(base).then((response) => {
        return response.json();
      });
    });
  }
});
