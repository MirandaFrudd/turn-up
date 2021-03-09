function reload() {
  // var container = document.querySelector(".unlock");
  const button = document.querySelector(".results-reload");
  button.addEventListener("click", (event) => {
    console.log(document.querySelectorAll(".refresh"))
    document.querySelectorAll(".refresh").location.reload(true);
  });

  // document.querySelectorAll(“.refresh”).location.reload();


  //this line is to watch the result in console , you can remove it later	
  console.log("Refreshed")
}

export { reload };

function updateDiv() {
  $(".refresh").load(window.location.href + " .refresh > *");
};

export { updateDiv };