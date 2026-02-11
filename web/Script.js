/* By Abdullah As-Sadeed */

"use strict";

try {
  console.log(
    "%c%s",
    "font-size: 16px; color: red; font-weight: bold;",
    "Do not input anything here.",
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

  document.addEventListener("DOMContentLoaded", function () {
    var audios = document.querySelectorAll(".audio");
    if (!audios.length) return;

    var canvases = document.querySelectorAll(".canvas");

    var audioContext = new window.AudioContext();

    audios.forEach(function (audio, index) {
      var canvas = canvases[index];
      if (!canvas) return;

      var canvasContext = canvas.getContext("2d");
      var analyser = audioContext.createAnalyser();
      var mediaElementSource = audioContext.createMediaElementSource(audio);

      mediaElementSource.connect(analyser);
      analyser.connect(audioContext.destination);

      analyser.fftSize = 2048;
      var bufferLength = analyser.fftSize;
      var dataArray = new Uint8Array(bufferLength);

      function visualize() {
        requestAnimationFrame(visualize);

        analyser.getByteTimeDomainData(dataArray);

        canvasContext.fillRect(0, 0, canvas.width, canvas.height);
        canvasContext.fillStyle = "#FFFFFF";
        canvasContext.lineWidth = 1;
        canvasContext.strokeStyle = "#00E1D4";
        canvasContext.beginPath();

        var sliceWidth = canvas.width / bufferLength;
        var x = 0;

        for (var iteration = 0; iteration < bufferLength; iteration++) {
          var value = dataArray[iteration] / 128.0;
          var y = (value * canvas.height) / 2;

          if (iteration === 0) {
            canvasContext.moveTo(x, y);
          } else {
            canvasContext.lineTo(x, y);
          }

          x += sliceWidth;
        }

        canvasContext.lineTo(canvas.width, canvas.height / 2);
        canvasContext.stroke();
      }

      audio.addEventListener("play", function () {
        audioContext.resume();
        visualize();
      });
    });
  });
} catch (error) {
  console.error(error);
  alert(error);
} finally {
}
