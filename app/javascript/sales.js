window.addEventListener("load", () => {
  // const sales = Array.from(document.getElementsByClassName("sale_field"));
  //   const lunches = Array.from(document.getElementsByClassName("lunch_field"));
  //   const dinners = Array.from(document.getElementsByClassName("dinner_field"));

  //  const changeValue = (sale,index) =>{
  //    if(Number.isInteger(sale.value)){
  //      dinners[index].value = sale.value/2
  //      lunches[index].value = sale.value/2
  //    }
  //  }
  //  const changeValueSale = (column,index)=>{
  //    if(Number.isInteger(column.value)){
  //      sales[index].value = dinners[index].value + lunches[index].value
  //    }
  //  }
  // sales.forEach((sale, index) => {
  //   sale.addEventListener('keyup',changeValue(sale,index))
  //   });
  // lunches.forEach((lunch, index) => {
  //     lunch.addEventListener('keyup',changeValueSale(lunch,index))
  //   });
  // dinners.forEach((dinner, index) => {
  //     dinner.addEventListener('keyup',changeValueSale(dinner,index))
  //   });

  // <script>
  //     const sales = Array.from(document.getElementsByClassName("sale_field"));
  //     const lunches = Array.from(document.getElementsByClassName("lunch_field"));
  //     const dinners = Array.from(document.getElementsByClassName("dinner_field"));

  //     const changeValue = (sale, index) => {
  //       if (Number.isInteger(sale.value)) {
  //         dinners[index].value = sale.value / 2
  //         lunches[index].value = sale.value / 2
  //       }
  //     }
  //     const changeValueSale = (column, index) => {
  //       if (Number.isInteger(column.value)) {
  //         sales[index].value = dinners[index].value + lunches[index].value
  //       }
  //     }
  //     sales.forEach((sale, index) => {
  //       sale.addEventListener('keyup', changeValue(sale, index))
  //     });
  //     lunches.forEach((lunch, index) => {
  //       lunch.addEventListener('keyup', changeValueSale(lunch, index))
  //     });
  //     dinners.forEach((dinner, index) => {
  //       dinner.addEventListener('keyup', changeValueSale(dinner, index))
  //     });
  //   </script>
  const sales = Array.from(document.getElementsByClassName("sale_field"));
  const lunches = Array.from(document.getElementsByClassName("lunch_field"));
  const dinners = Array.from(document.getElementsByClassName("dinner_field"));

  function changeSale(e) {
    const id = e.path[0].id
    const index = id.slice( 0, -4 ) ;
    console.log(index)
    const sale = document.getElementById(`${index}sale`);
    const lunch = document.getElementById(`${index}lunch`);
    const dinner = document.getElementById(`${index}dinner`);
    if(sale.value%2==0){
      lunch.value = sale.value / 2;
      dinner.value = sale.value / 2;
    }else{
      lunch.value = ((sale.value-1)/2)+1
      dinner.value = (sale.value-1)/2
    }

  }
  const changeLunch = (e) => {
    const id = e.path[0].id
    const index = id.slice( 0, -5 ) ;
    const sale = document.getElementById(`${index}sale`);
    const lunch = document.getElementById(`${index}lunch`);
    const dinner = document.getElementById(`${index}dinner`);
    console.log(lunch.value)
      sale.value = lunch.value + dinner.value;
    }

  const changeDinner = (e) => {
    const id = e.path[0].id
    const index = id.slice( 0, -6 ) ;
    const sale = document.getElementById(`${index}sale`);
    const lunch = document.getElementById(`${index}lunch`);
    const dinner = document.getElementById(`${index}dinner`);
      sale.value = lunch.value + dinner.value;

  };
  sales.forEach((sale) => {
    sale.addEventListener("keyup", changeSale);
  });
  lunches.forEach((lunch) => {
    lunch.addEventListener("keyup", changeLunch);
  });
  dinners.forEach((dinner, index) => {
    dinner.addEventListener("keyup", changeDinner);
  });
});
