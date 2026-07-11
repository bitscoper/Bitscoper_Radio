/* By Abdullah As-Sadeed */

"use strict";

if ("serviceWorker" in navigator) {
  navigator.serviceWorker.register("/Service_Worker.js");
}

window.document.onload = function () {
  var audios = Array.from(window.document.getElementsByTagName("audio"));
  var canvases = Array.from(window.document.getElementsByTagName("canvas"));

  if (audios.length && canvases.length) {
    var audioContext = new window.AudioContext();

    audios.forEach(function (audio, index) {
      var canvas = canvases[index];

      if (canvas) {
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
          canvasContext.fillStyle = "#1e1e2e";
          canvasContext.lineWidth = 1;
          canvasContext.strokeStyle = "#b4befe";
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

          canvas.style.display = "block";
          canvas.width = canvas.offsetWidth;
          canvas.height = canvas.offsetHeight;
          visualize();
        });
      } else {
        return;
      }
    });
  }
};
