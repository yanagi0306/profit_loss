function post() {
  let select_month = document.getElementById("search_year").value;
  let selected_month = document.getElementById("selected_month");
  selected_month.textContent = `${select_month}年`;
}

window.addEventListener("load", post);
