/* By Abdullah As-Sadeed */

"use strict";

const offline_url = "Offline.txt";

self.addEventListener("install", function () {
  self.skipWaiting();
});

self.addEventListener("activate", function (activation) {
  activation.waitUntil(
    caches.keys().then(function (cache_names) {
      for (let cache_name of cache_names) {
        caches.delete(cache_name);
      }

      caches.open("client").then(function (cache) {
        return cache.addAll([offline_url]);
      });
    })
  );
});

self.addEventListener("fetch", function (fetching) {
  fetching.respondWith(
    caches
      .match(fetching.request)
      .then(function (cached_response) {
        return cached_response || fetch(fetching.request);
      })
      .catch(function (error) {
        if (fetching.request.mode === "navigate") {
          return caches.match(offline_url);
        }
        throw error;
      })
  );
});
