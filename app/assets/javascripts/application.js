// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// Bootstrap4
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//以下ストップウォッチ用開始と終了時刻記録、使用しない
// let startTime;
// let stopTime;

// function getStartTime() {
//   startTime = new Date();
//   let hour = ("0" + startTime.getHours()).slice(-2);
//   let minute = ("0" + startTime.getMinutes()).slice(-2);
//   let time = hour + ":" + minute;
//   document.getElementById('startTime').innerHTML = time;
// }

// function getStopTime() {
//   stopTime = new Date();
//   let hour = ("0" + stopTime.getHours()).slice(-2);
//   let minute = ("0" + stopTime.getMinutes()).slice(-2);
//   let time = hour + ":" + minute;
//   document.getElementById('stopTime').innerHTML = time;
//   let diff = stopTime - startTime;
//   //経過分(minute)取得
//   const diffMinute = diff / (1000 * 60);
//   document.getElementById('interval').innerHTML = Math.floor(diffMinute);
//   //@minute.start= startTime;
//   //@minute.stop = stopTime;
// }
  