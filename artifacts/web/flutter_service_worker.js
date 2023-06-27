'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "918494e71851ed7a4171188789029d01",
"manifest.json": "987df79d78fb8c499afeaf982cbdf186",
"favicon.png": "7a26ea9d4e61122fc023b84e5acdb148",
"icons/favicon.png": "7a26ea9d4e61122fc023b84e5acdb148",
"icons/Icon-192.png": "12d05db1c0b26d429b54e3f8c946a496",
"icons/Icon-512.png": "aabba36693aba0ec8d954adf297d3125",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/fonts/MaterialIcons-Regular.otf": "c0b60a13c5d74b2c1d8915352a43498c",
"assets/NOTICES": "ce9a9f5519c1218c45f5bf2bb478f4da",
"assets/AssetManifest.json": "4bd216bd84fa5dba204f7bb0aaff28b8",
"assets/AssetManifest.bin": "647a45a1bfab5266fabc93f741fadf98",
"assets/assets/images/workroom_logo.png": "d791334d0cd2679c0f6a331facdaa431",
"assets/assets/images/temp.png": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/images/add_image_asset.png": "6d1cc662f0562ece3dae046027b0cb68",
"assets/assets/images/big_dot.png": "1b286e05050733d5fbb2fec2b3b12c65",
"assets/assets/images/dot.png": "6decb3330cd554eedd1defcbe9880244",
"assets/assets/images/content_dot.png": "44f43c6bef49d2cd3331bbffd623eb0a",
"assets/assets/fonts/GlacialIndifference-Bold.otf": "f801e234d51049bd538d3d95f6f4e110",
"assets/assets/fonts/GlacialIndifference-Italic.otf": "69b161f1f0d94f15afefbd34a37566d8",
"assets/assets/fonts/GlacialIndifference-Regular.otf": "13dc531a2ffd9ca7eeb500515774fa74",
"assets/assets/icons/home_screen_icons/station_icon.png": "d7da82c694441abba78fefef66e8e126",
"assets/assets/icons/home_screen_icons/save_icon.png": "2699e1aab4e43eba557c7cc73b127807",
"assets/assets/icons/home_screen_icons/building_icon.png": "1a8883542bd77b41c16ff248fd2d69b0",
"assets/assets/icons/home_screen_icons/unit_icon.png": "c59ea060d08beec545bb505a3353f786",
"assets/assets/icons/up_arrow.png": "05cdf615d3135357bcc73f2c253b82bc",
"assets/assets/icons/back_arrow.png": "e842284c8c9f57c01804715c31b5a320",
"assets/assets/icons/input.png": "6a037b842061daed2ba520deab6124af",
"assets/assets/icons/linked_sheets.png": "f3057106031eb7ffa6fb77830506ca8c",
"assets/assets/icons/access_screen_icons/access_detail_station_icon.png": "f3f8e708ff48010cf59563afc1048aa8",
"assets/assets/icons/access_screen_icons/success_icon.png": "e8a5ba27697c2b8c593e051b09911ab4",
"assets/assets/icons/access_screen_icons/gradient_sheet_icon.png": "2af2f299440f7fb79de13b86e83b4331",
"assets/assets/icons/access_screen_icons/large_sheet_icon.png": "db109b3ddd44c8033c88220d1104ff38",
"assets/assets/icons/access.png": "1a387194291b232ec0cd5eda9a731cd2",
"assets/assets/icons/actions.png": "63c87aec41b27ab1538cd42f963557d6",
"assets/assets/icons/more.png": "e60a538f5dfc3aa77d6b34b821395c7f",
"assets/assets/icons/sheetIcon.png": "d8264be7168e98ab63d54e171109fe44",
"assets/assets/icons/work_queue_icons/running_clock.png": "98c0ecb6730207b99955bd700fe56763",
"assets/assets/icons/work_queue_icons/qa_passed.png": "3f544bfc754b6626c00422839c950634",
"assets/assets/icons/down_arrow.png": "92c600c901ceea92c2ca9e085babfb20",
"assets/assets/icons/timer.png": "e5134f47a72e43d51e6a7a2d6902425b",
"assets/assets/icons/home.png": "0719227ba2b4b5e519ff54c98a5c85c4",
"assets/assets/icons/drop_down.png": "051be4246f1c97f5afab3a53513dcc3a",
"assets/FontManifest.json": "1a1afb2aa09c4a3e13f157bc10bda141",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"main.dart.js": "658a20f2fbdf22d5a3cb302304e36174",
"index.html": "21f466d761484eb0f76cbcdcb51da49d",
"/": "21f466d761484eb0f76cbcdcb51da49d",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de"};
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
