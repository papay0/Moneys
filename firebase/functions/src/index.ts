/* tslint:disable */

const admin = require('firebase-admin');
const functions = require('firebase-functions');
admin.initializeApp();
const db = admin.firestore();
db.settings({ timestampsInSnapshots: true });

exports.getMoneys = functions.https.onCall(async (data: any, context: any) => {
  console.log("getMoneys start")

  const defautMoneyToday = {
    type: "today",
    amount: "+130€",
    description: "Today",
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