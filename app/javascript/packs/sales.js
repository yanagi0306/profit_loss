
function post() {

const Ha = ()=>console.log('haha')
  const sales = Array.from(document.getElementsByClassName("sale_field"))
  const lunches = Array.from(document.getElementsByClassName("lunch_field"))
  const dinners = Array.from(document.getElementsByClassName("dinner_field"))

 const changeValue = (sale,index) =>{
   if(Number.isInteger(sale.value)){
     dinners[index].value = sale.value/2
     lunches[index].value = sale.value/2
   }
 }
 const changeValueSale = (column,index)=>{
   if(Number.isInteger(column.value)){
     sales[index].value = dinners[index].value + lunches[index].value
   }
 }
sales.forEach((sale, index) => {
    sale.onclick = Ha()
  });
lunches.forEach((lunch, index) => {
    lunch.addEventListener('keyup',changeValueSale(lunch,index))
  });
dinners.forEach((dinner, index) => {
    dinner.addEventListener('keyup',changeValueSale(dinner,index))
  });



  // lunches.forEach((lunch, index) => {
  //   lunch.addEventListener("change", () => {
  //     if (Number.isInteger(lunch.value)) {
  //       sales[index].value = lunch.value + dinners[index];
  //     }
  //   });
  // });
  // dinners.forEach((dinner, index) => {
  //   dinner.addEventListener("change", () => {
  //     if (Number.isInteger(dinner.value)) {
  //       sales[index].value = dinner.value + lunches[index];
  //     }
  //   });
  // });
}

window.addEventListener("load", post);
