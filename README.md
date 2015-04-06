# Cordova-Battery
Very simple cordova plugin to get the current battery level for android / ios


To get the battery percent at that current moment run:

````javascript
window.plugins.battery.getLevel(function(batteryPercent){
  console.log("Got Battery Level!", batteryPercent);
});
````
