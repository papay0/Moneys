/* tslint:disable */

const admin = require('firebase-admin');
const functions = require('firebase-functions');
admin.initializeApp();
const db = admin.firestore();
db.settings({ timestampsInSnapshots: true });
// const DeGiro = require('degiro');

exports.getMoneys = functions.https.onCall(async (data: any, context: any) => {
  console.log("getMoneys start")

  const username = data.username;
  const password = data.password;

  console.log("username is coming")
  console.log("username --> " + username)

  // const degiro = DeGiro.create({ username: username, password: password });
  // degiro
  //   .login()
  //   .then(session => console.log("session --> " + session))
  //   .catch(e => console.log("Critical failure: " + e.message));

    console.log("after degiro")

  const defautMoneyToday = {
    type: "today",
    amount: "+12€",
    description: "Todaydaydayday",
    isPositive: true
  }
  const defautMoneyCumulated = {
    type: "cumulated",
    amount: "-2€",
    description: "Cumulated",
    isPositive: false
  }
  const stockMoney = {
    type: "stock",
    todayAmount: "+2€",
    todayPourcentage: "+1%",
    cumulatedAmount: "-3€",
    cumulatedPourcentage: "-2%",
    stockName: "Uber",
    isTodayPositive: true,
    isCumulatedPositive: false,
  }
  return {
      defaultMoneys: [defautMoneyToday, defautMoneyCumulated],
      stockMoneys: [stockMoney, stockMoney]
  };
});