window.addEventListener("load", () => {
  const sales = Array.from(document.getElementsByClassName("sale_field"));
  const lunches = Array.from(document.getElementsByClassName("lunch_field"));
  const dinners = Array.from(document.getElementsByClassName("dinner_field"));

  function changeSale(e) {
    const id = e.path[0].id;
    const index = id.slice(0, -4);
    const sale = document.getElementById(`${index}sale`);
    const lunch = document.getElementById(`${index}lunch`);
    const dinner = document.getElementById(`${index}dinner`);
    if (sale.value % 2 == 0) {
      lunch.value = sale.value / 2;
      dinner.value = sale.value / 2;
    } else {
      lunch.value = (sale.value - 1) / 2 + 1;
      dinner.value = (sale.value - 1) / 2;
    }
  }
  const changeLunch = (e) => {
    const id = e.path[0].id;
    const index = id.slice(0, -5);
    const sale = document.getElementById(`${index}sale`);
    const lunch = document.getElementById(`${index}lunch`);
    const dinner = document.getElementById(`${index}dinner`);
    sale.value = parseInt(lunch.value) + parseInt(dinner.value);
  };

  const changeDinner = (e) => {
    const id = e.path[0].id;
    const index = id.slice(0, -6);
    const sale = document.getElementById(`${index}sale`);
    const lunch = document.getElementById(`${index}lunch`);
    const dinner = document.getElementById(`${index}dinner`);

    sale.value = parseInt(lunch.value) + parseInt(dinner.value);
  };
  sales.forEach((sale) => {
    sale.addEventListener("change", changeSale);
  });
  lunches.forEach((lunch) => {
    lunch.addEventListener("change", changeLunch);
  });
  dinners.forEach((dinner) => {
    dinner.addEventListener("change", changeDinner);
  });
});
