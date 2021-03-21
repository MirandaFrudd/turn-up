// function reload() {
//   // var container = document.querySelector(".unlock");
//   const button = document.querySelector(".results-reload");
//   button.addEventListener("click", (event) => {
//     console.log(document.querySelectorAll(".refresh"))
//     document.querySelectorAll(".refresh").location.reload(true);
//   });

//   // document.querySelectorAll(“.refresh”).location.reload();


//   //this line is to watch the result in console , you can remove it later
//   console.log("Refreshed")
// }

// export { reload };

// function updateDiv() {
//   $(".activity").load("window.location.href .activity");
//   console.log(document.querySelector(".activity"))
// };

// export { updateDiv };

const addLocks = () => {
  console.log("triggred")
  document.getElementById("lock-rest").addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("locked")
    document.getElementById("to-lock-rest").classList.toggle("d-none")
    document.getElementById("to-unlock-rest").classList.toggle("d-none")
  })
  document.getElementById("lock-bar").addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("locked")
    document.getElementById("to-lock-bar").classList.toggle("d-none")
    document.getElementById("to-unlock-bar").classList.toggle("d-none")
  })
  document.getElementById("lock-activity").addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("locked")
    document.getElementById("to-lock-activity").classList.toggle("d-none")
    document.getElementById("to-unlock-activity").classList.toggle("d-none")
  })
}



const load = () => {
  if (!document.getElementById("lock-rest").classList.contains("locked")) {
    loadRest()
  }
  if (!document.getElementById("lock-bar").classList.contains("locked")) {
    loadBar()
  }
  if (!document.getElementById("lock-activity").classList.contains("locked")) {
    loadActivity()
  }
}


const loadRest = () => {
  fetch('/index_restaurant', { headers: { accept: 'application/json' } })
    .then(response => response.json())
    // .then(response => console.log(response))
    .then((data) => {
      document.querySelector(".restaurant-modal-body").innerHTML = `
      <p>
        ${data.restaurant.name} <br>
        ${data.restaurant.description}
      </p>
        `

      document.getElementById("shuffle-rest").innerHTML = `
      <div class="card-element">
        <img class="cover" src="http://res.cloudinary.com/dkzi7cweg/image/upload/${data.photo}">
        <div class="card-element-content">
          <div>
            <div class="card-element-top">
              <div>
                <h3><strong> ${data.restaurant.name} </strong></h3>
                <p><strong> ${data.restaurant.address.substring(0, 40)}... </strong></p>
              </div>
              <div class="restaurant-icon">
                <span class="material-icons md-36 md-swiss-coffee center">restaurant</span>
              </div>
            </div>
            <p class="desc-margin"> ${data.restaurant.description.substring(0, 65)}... </p>
          </div>
          <div class="main-card-icons">
            <div class="budget icon-margin">
              ${
                (`<i class="fas fa-pound-sign"></i> `).repeat(Number(data.restaurant.budget))
              }
            </div>
            ${ (data.restaurant.day && data.restaurant.night) ? `<span class="material-icons md-15 icon-margin">brightness_4</span>` :
                  data.restaurant.night ? `<span class="material-icons md-15 icon-margin">brightness_2</span>` : `<span class="material-icons md-15 icon-margin">brightness_5</span>` }
          </div>
        </div>
      </div>
      `
      document.getElementById("favourite_restaurant_id").value = data.restaurant.id
    })
}

const loadBar = () => {
  fetch('/index_bar', { headers: { accept: 'application/json' } })
    .then(response => response.json())
    // .then(response => console.log(response))
    .then((data) => {
      document.querySelector(".bar-modal-body").innerHTML = `
      <p>
        ${data.bar.name} <br>
        ${data.bar.description}
      </p>
        `
      document.getElementById("shuffle-bar").innerHTML = `
      <div class = "card-element">
        <img class="cover" src="http://res.cloudinary.com/dkzi7cweg/image/upload/${data.photo}">
        <div class="card-element-content">
          <div>
            <div class="card-element-top">
              <div>
                <h3><strong> ${data.bar.name} </strong></h3>
                <p><strong> ${data.bar.address.substring(0, 40)}... </strong></p>
              </div>
              <div class="bar-icon">
                <span class="material-icons md-36 md-swiss-coffee">local_bar</span>
              </div>
            </div>
            <p class="desc-margin"> ${data.bar.description.substring(0, 65)}... </p>
          </div>
          <div class="main-card-icons">
            <div class="budget icon-margin">
              ${
                (data.bar.budget === 1) ? `<i class="fas fa-pound-sign"></i>` :
                (data.bar.budget === 2) ? `<i class="fas fa-pound-sign"></i> <i class="fas fa-pound-sign"></i>` :
                (data.bar.budget === 3) ? `<i class="fas fa-pound-sign"></i> <i class="fas fa-pound-sign"></i> <i class="fas fa-pound-sign"></i>` : `<i class="fas fa-pound-sign"></i> <i class="fas fa-pound-sign"></i> <i class="fas fa-pound-sign"></i> <i class="fas fa-pound-sign"></i>`
              }
            </div>
              ${(data.bar.day && data.bar.night) ? `<span class="material-icons md-15 icon-margin">brightness_4</span>` :
                data.bar.night ? `<span class="material-icons md-15 icon-margin">brightness_2</span>` : `<span class="material-icons md-15 icon-margin">brightness_5</span>` }
          </div>
        </div>
      </div>
      `
      document.getElementById("favourite_bar_id").value = data.bar.id
    })
}

const loadActivity = () => {
  fetch('/index_activity', { headers: { accept: 'application/json' } })
    .then(response => response.json())
    // .then(response => console.log(response))
    .then((data) => {
      // let activityLink = document.querySelector(".activity-link")
      // activityLink.setAttribute("href", `/activities/${data.activity.id}`)

      document.querySelector(".activity-modal-body").innerHTML = `
      <p>
        ${data.activity.name} <br>
        ${data.activity.description}
      </p>
        `

      document.getElementById("shuffle-activity").innerHTML = `
      <div class = "card-element">
        <img class="cover" src="http://res.cloudinary.com/dkzi7cweg/image/upload/${data.photo}">
        <div class="card-element-content">
          <div>
            <div class="card-element-top">
              <div>
                <h3><strong> ${data.activity.name} </strong></h3>
                <p><strong> ${data.activity.address.substring(0, 40)}... </strong></p>
              </div>
              <div class="activity-icon">
                <span class="material-icons md-36 md-swiss-coffee">attractions</span>
              </div>
            </div>
            <p class="desc-margin"> ${data.activity.description.substring(0, 65)}... </p>
          </div>
          <div class="main-card-icons">
            <div class="budget icon-margin">
              ${
                (data.activity.budget === 1) ? `<i class="fas fa-pound-sign"></i>` :
                (data.activity.budget === 2) ? `<i class="fas fa-pound-sign"></i> <i class="fas fa-pound-sign"></i>` :
                (data.activity.budget === 3) ? `<i class="fas fa-pound-sign"></i> <i class="fas fa-pound-sign"></i> <i class="fas fa-pound-sign"></i>` : `<i class="fas fa-pound-sign"></i> <i class="fas fa-pound-sign"></i> <i class="fas fa-pound-sign"></i> <i class="fas fa-pound-sign"></i>`
              }
            </div>
              ${(data.activity.day && data.activity.night) ? `<span class="material-icons md-15 icon-margin">brightness_4</span>` :
                data.activity.night ? `<span class="material-icons md-15 icon-margin">brightness_2</span>` : `<span class="material-icons md-15 icon-margin">brightness_5</span>` }
          </div>
        </div>
      </div>
      `
      document.getElementById("favourite_activity_id").value = data.activity.id
    })
}


  export { load, addLocks }
