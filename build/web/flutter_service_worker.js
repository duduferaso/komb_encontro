'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "f1060722cabe152e476b7eae82ea2638",
"assets/AssetManifest.smcbin": "6eda1e7b57bae7d6a12c495b94532518",
"assets/FontManifest.json": "2c2ff4ab4905597919751861aa7213c4",
"assets/NOTICES": "409ca96d20b7f017c2a38c81ad56e286",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/web/carrosel/azul.jpeg": "2c24be3927752c97e55680e45953b654",
"assets/web/carrosel/branca1.jpeg": "7e1efb69cdbec444a21baed652edb5bf",
"assets/web/carrosel/branca2.jpeg": "28e4c05177bba5fa3f18da8e99879b29",
"assets/web/carrosel/gol3.jpeg": "67dc71925ce9223cb68067b444eac4d6",
"assets/web/carrosel/preta.jpeg": "7ffd3f5c79556aa71e5ab29eea73ac4a",
"assets/web/fontes/fresca.ttf": "8b979a2d1e5765da9bc477792c8ceb3f",
"assets/web/fontes/stencil.ttf": "562bf64911a7a980333915246be161da",
"assets/web/img/kombismo_branco2.png": "c1a7dac7b92cb4e421cfc2ff99514c4b",
"assets/web/img/kombismo_fu2.jpeg": "0d73ff290e5509f95074142ea3957478",
"assets/web/img/kombismo_fu2.png": "b2b7b2902e35ffa70bbe666258da7cc0",
"assets/web/img/logopreta2.png": "15223148091f6dc70d7f634030253f7f",
"assets/web/img/old3.jpg": "0cc76b14095b4f9feb953404ff526afa",
"assets/web/patrocinadores/ambioeste.jpg": "c8d4c0c38ccb5649af304e9ae5e7c13b",
"assets/web/patrocinadores/IORA.jpg": "5ee9d71ca15db342f283fc4932fb1e98",
"assets/web/patrocinadores/laserdj.jpg": "57d1b70805a6cd07978b686a4b9b7792",
"assets/web/patrocinadores/tarab.jpg": "ef89cbd79b6f876c943b9351b54fe9ab",
"assets/web%255Ccarrosel%255Cazul.jpeg": "2c24be3927752c97e55680e45953b654",
"assets/web%255Ccarrosel%255Cbranca1.jpeg": "7e1efb69cdbec444a21baed652edb5bf",
"assets/web%255Ccarrosel%255Cbranca2.jpeg": "28e4c05177bba5fa3f18da8e99879b29",
"assets/web%255Ccarrosel%255Cgol3.jpeg": "67dc71925ce9223cb68067b444eac4d6",
"assets/web%255Ccarrosel%255Cpreta.jpeg": "7ffd3f5c79556aa71e5ab29eea73ac4a",
"assets/web%255Cpatrocinadores%255Cambioeste.jpg": "c8d4c0c38ccb5649af304e9ae5e7c13b",
"assets/web%255Cpatrocinadores%255CIORA.jpg": "5ee9d71ca15db342f283fc4932fb1e98",
"assets/web%255Cpatrocinadores%255Claserdj.jpg": "57d1b70805a6cd07978b686a4b9b7792",
"assets/web%255Cpatrocinadores%255Ctarab.jpg": "ef89cbd79b6f876c943b9351b54fe9ab",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"carrosel/azul.jpeg": "2c24be3927752c97e55680e45953b654",
"carrosel/branca1.jpeg": "7e1efb69cdbec444a21baed652edb5bf",
"carrosel/branca2.jpeg": "28e4c05177bba5fa3f18da8e99879b29",
"carrosel/gol3.jpeg": "67dc71925ce9223cb68067b444eac4d6",
"carrosel/preta.jpeg": "7ffd3f5c79556aa71e5ab29eea73ac4a",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"fontes/fresca.ttf": "8b979a2d1e5765da9bc477792c8ceb3f",
"fontes/stencil.ttf": "562bf64911a7a980333915246be161da",
"img/kombismo_branco2.png": "c1a7dac7b92cb4e421cfc2ff99514c4b",
"img/kombismo_fu2.jpeg": "0d73ff290e5509f95074142ea3957478",
"img/kombismo_fu2.png": "b2b7b2902e35ffa70bbe666258da7cc0",
"img/logopreta2.png": "15223148091f6dc70d7f634030253f7f",
"img/old3.jpg": "0cc76b14095b4f9feb953404ff526afa",
"index.html": "1580360f2745c2bec2aebaef5d96a2f6",
"/": "1580360f2745c2bec2aebaef5d96a2f6",
"main.dart": "88b062a88d252cd84a437993ec7f0469",
"main.dart.js": "ee97ca13e9760fb754177602a01ded0e",
"patrocinadores/ambioeste.jpg": "c8d4c0c38ccb5649af304e9ae5e7c13b",
"patrocinadores/IORA.jpg": "5ee9d71ca15db342f283fc4932fb1e98",
"patrocinadores/laserdj.jpg": "57d1b70805a6cd07978b686a4b9b7792",
"patrocinadores/tarab.jpg": "ef89cbd79b6f876c943b9351b54fe9ab",
"styles.css": "6464ffd83e0e9cf564bfeb0fec2dcbda",
"version.json": "789e9385a9226c65d27d3695dd68af8b"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
