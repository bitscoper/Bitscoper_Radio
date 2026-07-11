/* By Abdullah As-Sadeed */

"use strict";

const cacheName = "Bitscoper_Radio";
const offlineFallbackPage = "Offline_Fallback.txt";

self.onmessage = function (event) {
  if (event.data && event.data?.type === "SKIP_WAITING") {
    self.skipWaiting();
  }
};

self.addEventListener("install", async function (event) {
  event.waitUntil(
    caches.open(cacheName).then((cache) => cache.add(offlineFallbackPage)),
  );
});

self.addEventListener("activate", function (event) {
  event.waitUntil(
    (async function () {
      if ("navigationPreload" in self.registration) {
        await self.registration.navigationPreload.disable();
      }

      await self.clients.claim();
    })(),
  );
});

self.addEventListener("fetch", function (event) {
  if (event.request.mode === "navigate") {
    event.respondWith(
      (async function () {
        try {
          const networkResponse = await fetch(event.request);

          return networkResponse;
        } catch (error) {
          const cache = await caches.open(cacheName);
          const cachedResponse = await cache.match(offlineFallbackPage);

          return cachedResponse;
        }
      })(),
    );
  }
});
