window.addEventListener("load", () => {
  const sales = Array.from(document.getElementsByClassName("sale_field"));
  const lunches = Array.from(document.getElementsByClassName("lunch_field"));
  const dinners = Array.from(document.getElementsByClassName("dinner_field"));
  const delivery_lunches = Array.from(
    document.getElementsByClassName("delivery_lunch_field")
  );
  const delivery_dinners = Array.from(
    document.getElementsByClassName("delivery_dinner_field")
  );

  function changeSale(e) {
    const id = e.path[0].id;
    const index = id.slice(0, -4);
    const sale = document.getElementById(`${index}sale`);
    const lunch = document.getElementById(`${index}lunch`);
    const dinner = document.getElementById(`${index}dinner`);
    const delivery_lunch = document.getElementById(`${index}delivery_lunch`);
    const delivery_dinner = document.getElementById(`${index}delivery_dinner`);
    if (sale.value % 4 == 0) {
      lunch.value = sale.value / 4;
      dinner.value = sale.value / 4;
      delivery_lunch.value = sale.value / 4;
      delivery_dinner.value = sale.value / 4;
    } else if (sale.value % 4 == 1) {
      lunch.value = (sale.value - 1) / 4 + 1;
      dinner.value = (sale.value - 1) / 4;
      delivery_lunch.value = (sale.value - 1) / 4;
      delivery_dinner.value = (sale.value - 1) / 4;
    } else if (sale.value % 4 == 2) {
      lunch.value = (sale.value - 2) / 4 + 1;
      dinner.value = (sale.value - 2) / 4 + 1;
      delivery_lunch.value = (sale.value - 2) / 4;
      delivery_dinner.value = (sale.value - 2) / 4;
    } else if (sale.value % 4 == 3) {
      lunch.value = (sale.value - 3) / 4 + 1;
      dinner.value = (sale.value - 3) / 4 + 1;
      delivery_lunch.value = (sale.value - 3) / 4 + 1;
      delivery_dinner.value = (sale.value - 3) / 4;
    }
  }
  const changeLunch = (e) => {
    const id = e.path[0].id;
    const index = id.slice(0, -5);
    const sale = document.getElementById(`${index}sale`);
    const lunch = document.getElementById(`${index}lunch`);
    const dinner = document.getElementById(`${index}dinner`);
    const delivery_lunch = document.getElementById(`${index}delivery_lunch`);
    const delivery_dinner = document.getElementById(`${index}delivery_dinner`);
    sale.value = parseInt(lunch.value) + parseInt(dinner.value) + parseInt(delivery_lunch.value) + parseInt(delivery_dinner.value);
  };

  const changeDinner = (e) => {
    const id = e.path[0].id;
    const index = id.slice(0, -6);
    const sale = document.getElementById(`${index}sale`);
    const lunch = document.getElementById(`${index}lunch`);
    const dinner = document.getElementById(`${index}dinner`);
    const delivery_lunch = document.getElementById(`${index}delivery_lunch`);
    const delivery_dinner = document.getElementById(`${index}delivery_dinner`);

    sale.value = parseInt(lunch.value) + parseInt(dinner.value) + parseInt(delivery_lunch.value) + parseInt(delivery_dinner.value);
  };

  const changeDeliveryLunch = (e) => {
    const id = e.path[0].id;
    const index = id.slice(0, -14);
    const sale = document.getElementById(`${index}sale`);
    const lunch = document.getElementById(`${index}lunch`);
    const dinner = document.getElementById(`${index}dinner`);
    const delivery_lunch = document.getElementById(`${index}delivery_lunch`);
    const delivery_dinner = document.getElementById(`${index}delivery_dinner`);

    sale.value = parseInt(lunch.value) + parseInt(dinner.value) + parseInt(delivery_lunch.value) + parseInt(delivery_dinner.value);
  };

  const changeDeliveryDinner = (e) => {
    const id = e.path[0].id;
    const index = id.slice(0, -15);
    const sale = document.getElementById(`${index}sale`);
    const lunch = document.getElementById(`${index}lunch`);
    const dinner = document.getElementById(`${index}dinner`);
    const delivery_lunch = document.getElementById(`${index}delivery_lunch`);
    const delivery_dinner = document.getElementById(`${index}delivery_dinner`);

    sale.value = parseInt(lunch.value) + parseInt(dinner.value) + parseInt(delivery_lunch.value) + parseInt(delivery_dinner.value);
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
  delivery_lunches.forEach((delivery_lunch) => {
    delivery_lunch.addEventListener("change", changeDeliveryLunch);
  });
  delivery_dinners.forEach((delivery_dinner) => {
    delivery_dinner.addEventListener("change", changeDeliveryDinner);
  });
});
