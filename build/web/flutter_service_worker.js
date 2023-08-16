'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "3c6da621918a510c984ba2217a840d51",
"assets/AssetManifest.smcbin": "3e5a28fd4fe09772060c953035f8fd18",
"assets/FontManifest.json": "581aec9f46784b85cf911687dc61f865",
"assets/lib/carrosel/azul.jpeg": "2c24be3927752c97e55680e45953b654",
"assets/lib/carrosel/branca1.jpeg": "7e1efb69cdbec444a21baed652edb5bf",
"assets/lib/carrosel/branca2.jpeg": "28e4c05177bba5fa3f18da8e99879b29",
"assets/lib/carrosel/branca3.jpeg": "44aecd34aa04596a5bf3aa6150c5cd00",
"assets/lib/carrosel/juntas.jpeg": "35f51953b1461410fb9bb3f897f8a29f",
"assets/lib/carrosel/preta.jpeg": "7ffd3f5c79556aa71e5ab29eea73ac4a",
"assets/lib/carrosel/preta2.jpeg": "5fe2c0f7b047060b9db474e49c0fdee3",
"assets/lib/fontes/fresca.ttf": "8b979a2d1e5765da9bc477792c8ceb3f",
"assets/lib/fontes/stencil.ttf": "562bf64911a7a980333915246be161da",
"assets/lib/img/kombismo_branco2.png": "c1a7dac7b92cb4e421cfc2ff99514c4b",
"assets/lib/img/old3.jpg": "0cc76b14095b4f9feb953404ff526afa",
"assets/lib/patrocinadores/ambioeste.jpg": "c8d4c0c38ccb5649af304e9ae5e7c13b",
"assets/lib/patrocinadores/armazem.jpg": "0f831bcf62e2186ca01af8734d86b191",
"assets/lib/patrocinadores/dalla.jpeg": "1d3266626da9ce9bd4d403fe5ebe9057",
"assets/lib/patrocinadores/delivery.jpeg": "70cd29cd0342355b7a3970937c8e8e6d",
"assets/lib/patrocinadores/IORA.jpeg": "d4e1f0a358fc919062bcb69e19e2384a",
"assets/lib/patrocinadores/laserdj.jpg": "57d1b70805a6cd07978b686a4b9b7792",
"assets/lib/patrocinadores/sabedot.jpg": "23ec000a358a23135a5a3202cec536ec",
"assets/lib/patrocinadores/santochopp.jpeg": "87fd793909b0a2899560feed1f76f8df",
"assets/lib/patrocinadores/tarab.jpg": "d48412c0eed1ee8d46c794a5a6854238",
"assets/lib%255Ccarrosel%255Cazul.jpeg": "2c24be3927752c97e55680e45953b654",
"assets/lib%255Ccarrosel%255Cbranca1.jpeg": "7e1efb69cdbec444a21baed652edb5bf",
"assets/lib%255Ccarrosel%255Cbranca2.jpeg": "28e4c05177bba5fa3f18da8e99879b29",
"assets/lib%255Ccarrosel%255Cbranca3.jpeg": "44aecd34aa04596a5bf3aa6150c5cd00",
"assets/lib%255Ccarrosel%255Cjuntas.jpeg": "35f51953b1461410fb9bb3f897f8a29f",
"assets/lib%255Ccarrosel%255Cpreta.jpeg": "7ffd3f5c79556aa71e5ab29eea73ac4a",
"assets/lib%255Ccarrosel%255Cpreta2.jpeg": "5fe2c0f7b047060b9db474e49c0fdee3",
"assets/lib%255Cimg%255Ckombismo_branco2.png": "c1a7dac7b92cb4e421cfc2ff99514c4b",
"assets/lib%255Cimg%255Cold3.jpg": "0cc76b14095b4f9feb953404ff526afa",
"assets/lib%255Cpatrocinadores%255Cambioeste.jpg": "c8d4c0c38ccb5649af304e9ae5e7c13b",
"assets/lib%255Cpatrocinadores%255Carmazem.jpg": "0f831bcf62e2186ca01af8734d86b191",
"assets/lib%255Cpatrocinadores%255Cdalla.jpeg": "1d3266626da9ce9bd4d403fe5ebe9057",
"assets/lib%255Cpatrocinadores%255Cdelivery.jpeg": "70cd29cd0342355b7a3970937c8e8e6d",
"assets/lib%255Cpatrocinadores%255CIORA.jpeg": "d4e1f0a358fc919062bcb69e19e2384a",
"assets/lib%255Cpatrocinadores%255Claserdj.jpg": "57d1b70805a6cd07978b686a4b9b7792",
"assets/lib%255Cpatrocinadores%255Csabedot.jpg": "23ec000a358a23135a5a3202cec536ec",
"assets/lib%255Cpatrocinadores%255Csantochopp.jpeg": "87fd793909b0a2899560feed1f76f8df",
"assets/lib%255Cpatrocinadores%255Ctarab.jpg": "d48412c0eed1ee8d46c794a5a6854238",
"assets/NOTICES": "6dae969c47fd2388ecf56cb68ccedb04",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/web/carrosel/azul.jpeg": "2c24be3927752c97e55680e45953b654",
"assets/web/carrosel/branca1.jpeg": "7e1efb69cdbec444a21baed652edb5bf",
"assets/web/carrosel/branca2.jpeg": "28e4c05177bba5fa3f18da8e99879b29",
"assets/web/carrosel/preta.jpeg": "7ffd3f5c79556aa71e5ab29eea73ac4a",
"assets/web/fontes/fresca.ttf": "8b979a2d1e5765da9bc477792c8ceb3f",
"assets/web/fontes/stencil.ttf": "562bf64911a7a980333915246be161da",
"assets/web/img/kombismo_branco2.png": "c1a7dac7b92cb4e421cfc2ff99514c4b",
"assets/web/img/old3.jpg": "0cc76b14095b4f9feb953404ff526afa",
"assets/web/patrocinadores/ambioeste.jpg": "c8d4c0c38ccb5649af304e9ae5e7c13b",
"assets/web/patrocinadores/IORA.jpg": "5ee9d71ca15db342f283fc4932fb1e98",
"assets/web/patrocinadores/laserdj.jpg": "57d1b70805a6cd07978b686a4b9b7792",
"assets/web/patrocinadores/tarab.jpg": "ef89cbd79b6f876c943b9351b54fe9ab",
"assets/web%255Ccarrosel%255Cazul.jpeg": "2c24be3927752c97e55680e45953b654",
"assets/web%255Ccarrosel%255Cbranca1.jpeg": "7e1efb69cdbec444a21baed652edb5bf",
"assets/web%255Ccarrosel%255Cbranca2.jpeg": "28e4c05177bba5fa3f18da8e99879b29",
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
"carrosel/preta.jpeg": "7ffd3f5c79556aa71e5ab29eea73ac4a",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"fontes/fresca.ttf": "8b979a2d1e5765da9bc477792c8ceb3f",
"fontes/stencil.ttf": "562bf64911a7a980333915246be161da",
"img/kombismo_branco2.png": "c1a7dac7b92cb4e421cfc2ff99514c4b",
"img/old3.jpg": "0cc76b14095b4f9feb953404ff526afa",
"index.html": "1580360f2745c2bec2aebaef5d96a2f6",
"/": "1580360f2745c2bec2aebaef5d96a2f6",
"main.dart": "f047407a41823ae46096cdfd8e3e4409",
"main.dart.js": "569ffc245e11852310692018bca0ff60",
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
