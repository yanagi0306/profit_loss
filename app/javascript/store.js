const month1_budget = gon.month1_budget;
const month2_budget = gon.month2_budget;
const month1 = gon.month1_achievement;
const month2 = gon.month2_achievement;
const this_budget = gon.budget;
const this_month = gon.achievement;
const lunch_color = "rgb(168, 255, 149)";
const sale_color = "rgb(92, 92, 97)";
const dinner_color = "rgb(148, 206, 254)";
const dt = new Date();
const dt1 = new Date();
const dt2 = new Date();
dt1.setMonth(dt1.getMonth() - 1);
dt2.setMonth(dt2.getMonth() - 2);
console.log(dt.getMonth());
console.log(dt1.getMonth());
console.log(dt2.getMonth());

const background_colors = () => {
  const colors = [];
  for (let i = 0; i < 11; i++) {
    if (i % 4 == 0) {
      colors.push(lunch_color);
    } else if (i % 4 == 1) {
      colors.push(sale_color);
    } else if (i % 4 == 2) {
      colors.push(dinner_color);
    } else {
      colors.push("");
    }
  }
  return colors;
};

window.draw_graph = () => {
  const ctx = document.getElementById("myChart").getContext("2d");
  const myChart = new Chart(ctx, {
    type: "line",
    data: {
      datasets: [
        {
          label: "売上予算",
          data: [
            ,
            month2_budget["sale"],
            ,
            ,
            ,
            month1_budget["sale"],
            ,
            ,
            ,
            this_budget["sale"],
            ,
          ],

          borderColor: "rgb(128, 133, 233)",
          backgroundColor: "rgb(128, 133, 233)",
          borderWidth: 2,
          lineTension: 0.2,
          spanGaps: true,
        },
        {
          label: "売上実績",
          data: [
            month2["lunch_sale"],
            month2["sale"],
            month2["dinner_sale"],
            ,
            month1["lunch_sale"],
            month1["sale"],
            month1["dinner_sale"],
            ,
            this_month["lunch_sale"],
            this_month["sale"],
            this_month["dinner_sale"],
          ],
          backgroundColor: background_colors,
          type: "bar",
        },
      ],
      labels: [
        "ランチ",
        `${dt2.getFullYear()}年${dt2.getMonth() + 1}月`,
        "ディナー",
        "",
        "ランチ",
        `${dt1.getFullYear()}年${dt1.getMonth() + 1}月`,
        "ディナー",
        ,
        "ランチ",
        `${dt.getFullYear()}年${dt.getMonth() + 1}月`,
        "ディナー",
      ],
    },
    options: {
      responsive: false,
      maintainAspectRatio: false,
    },
  });
};
