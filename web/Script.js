/* By Abdullah As-Sadeed */

"use strict";

console.log(
  "%c%s",
  "background-color: red; padding: 20px 10px 20px 10px; font-size: 18px; color: white; font-weight: bold;",
  "Do not input anything here."
);

document.oncontextmenu = function (menu) {
  menu.preventDefault();
  alert("Context Menu is not allowed.");
  return false;
};

document.onkeydown = function (keyboard) {
  if (
    keyboard.key == "F12" ||
    (keyboard.ctrlKey && keyboard.shiftKey && keyboard.key == "i") ||
    (keyboard.ctrlKey && keyboard.shiftKey && keyboard.key == "j") ||
    (keyboard.ctrlKey && keyboard.key == "u")
  ) {
    keyboard.preventDefault();

    alert("Developer tools are not allowed.");

    return false;
  } else if (
    keyboard.Code == "PrintScreen" ||
    (keyboard.ctrlKey && keyboard.key == "p")
  ) {
    keyboard.preventDefault();

    alert("Printing is not allowed.");

    return false;
  } else if (keyboard.ctrlKey && keyboard.key == "s") {
    keyboard.preventDefault();

    alert("Saving is not allowed.");

    return false;
  }
};

if ("serviceWorker" in navigator) {
  navigator.serviceWorker.register("Service_Worker.js");
}
