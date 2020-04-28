'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "c736d170742664b5214ef43b200d0dfa",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.ico": "4aed3fa96166e01b36b02d887eaccece",
"icons/android-icon-144x144.png": "6e723117ebc9e6445603f12b4712a7c4",
"icons/android-icon-192x192.png": "e7ab43b4dd8cb992b7d5f6ad71e5ea7f",
"icons/android-icon-36x36.png": "5126d5ce454db7e46556273cbee3d8b9",
"icons/android-icon-48x48.png": "c54918972b136a3533a8e668ebe5d168",
"icons/android-icon-72x72.png": "22a8ab1845cfbaf437613cedcd8241ea",
"icons/android-icon-96x96.png": "c823866fbc747ca36cf68cf8cfba3229",
"index.html": "7ba3ffd790e8e95a32a86398abaa9b01",
"/": "7ba3ffd790e8e95a32a86398abaa9b01",
"main.dart.js": "17b5ee3ff73e28dcb3e09fbb9792e268",
"manifest.json": "91ca1f2da6487206294f0265f506cafc"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
