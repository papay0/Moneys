/* tslint:disable */

const admin = require('firebase-admin');
const functions = require('firebase-functions');
admin.initializeApp();
const db = admin.firestore();
db.settings({ timestampsInSnapshots: true });

exports.getMoneys = functions.https.onCall(async (data: any, context: any) => {
  console.log("getMoneys start")
  const defautMoney = {
    type: "today",
    amount: "+12",
    description: "Today",
    isPositive: true
  }
  const stockMoney = {
    type: "stock",
    todayAmount: "+2",
    todayPourcentage: "+1%",
    cumulatedAmount: "-3",
    cumulatedPourcentage: "-2%",
    stockName: "Uber",
    isTodayPositive: true,
    isCumulatedPositive: false,
  }
  return {
      defaultMoneys: [defautMoney],
      stockMoneys: [stockMoney, stockMoney]
  };
});