'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "687df6ac3bce808ce7dce93b3469c9a5",
"version.json": "6fe105b9947003fed4c0758410d80a54",
"index.html": "3c854fcef58f23fb5dd62d5027e7650f",
"/": "3c854fcef58f23fb5dd62d5027e7650f",
"main.dart.js": "dc89122005ed6d25ebc3536f910364ed",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"README.md": "ab42f456de9cd5f61af914b817ffa288",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"FontManifest.json": "5b911fdf124ccd10c855b936ce7eadef",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "4fc5ab64cf2a4ea881cf09a7ae80c2f0",
".git/ORIG_HEAD": "8091dbcb9fa8ba9c55ccdb5e92a56014",
".git/config": "71f7500bc45d3b41ffcd72fa6b7d087d",
".git/objects/0d/c965e93254a4696840dc269d565bfb9859a81a": "97ecb7fbf26629162f1470b86d53d305",
".git/objects/0d/43f815213e74c99adef46c939b48d6a61747eb": "cadca5b72ebaac76c9cf6d542f4d3111",
".git/objects/92/a6f5f82060aa3a2306de47591909d0bd2589ee": "670197ea14e46d5192eb56cc1c188a02",
".git/objects/3e/d0ddd7136a48520910e7e4bf665362facd60d4": "c8322669a78b5f07c75b1decdc05718d",
".git/objects/50/d7c27ef5987b5c38e1a866c549e43da31e375b": "d7caa7c528515a31eaae22d97a302a19",
".git/objects/6f/c774d045dd1127c977d6257ff2e3fd53e180c5": "44b88eafb527e85cbd53115689860c24",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/9e/26dfeeb6e641a33dae4961196235bdb965b21b": "304148c109fef2979ed83fbc7cd0b006",
".git/objects/58/ae13cad944a08fb822f762bcbd77f084efb761": "03d81ce78ec9c1e33cdd2ab0a87a6a14",
".git/objects/0b/095800d6f4f4ccd3ce70da0f5b8f2ded202d12": "c7018bca47962e1babd70bcdde4d96a2",
".git/objects/0e/da8d8a4e2cc43b8c3f175a66ce3803a754ae08": "caadddb866b1ceecbf988181c246f30d",
".git/objects/5f/38217f1a15ac1ca569d36133835f436cc6bebc": "159a25fdca7a08edb5a7fabbccb13964",
".git/objects/9c/22d0a0dcd729a05f972741d8372f99716af669": "02fb52969d942aa2d78ae1f8ff4caec4",
".git/objects/ac/9647533e9e4d2b763110b6cd7288a21f1c4fa6": "6d10c8bff0fccfedce64b36e096e7c8f",
".git/objects/ad/7d2a337cb726edfe524eba24614791c8e0c37a": "711e33da00b59e0c85498ccc40bf411b",
".git/objects/df/4e1bcf8c259998fe7dd781eb4a8198373df227": "8c91506be20d802bad0a7fc7893d791a",
".git/objects/a5/b14d61684806233a373357fe2a8f081ad1f941": "610e8632417d24b5ce268289a4a620b4",
".git/objects/a5/e95bab6ce70e2b4174d716938d07e1d2d26989": "6026747a827b4a537349092c33b720f6",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d6/cdbd4b1c06d8e453495d52924456e074f050d3": "f5deb22349447618ccb929665176506a",
".git/objects/ae/f8631177e77fcb1a1879b34b1ddb1352d03480": "254a770312581a904f1af3b45f980a28",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/c7/2752e94887fbd3e1965b5f63383db40ad786d8": "fa7cd396fa26c88ed0a55fefaeab42e2",
".git/objects/c0/dedc0b1e222b027bb0d1a9f9c53d8620abe4f4": "0e8b4b82052312bdc8e9e4779ea94462",
".git/objects/ee/4eec54b2eaef86efff45caceed51ead24ae648": "489a2e81a3a5d15a9ebd8e0f864ab005",
".git/objects/ee/0e319c5539dbb17d9167d3b7194b5e1a963b42": "b8904b0dc33f998f23b01fa587059178",
".git/objects/c9/16a63219a68093612f9539f89deadba9e00948": "aeba41abd40790fb30d89d1001412829",
".git/objects/fc/8e395a66372a80b361b88fc74e1e0f80d1ece7": "77bb8bed7a6d1256af5a81650346638c",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/cf/16da1a06af3080c486281d5b3fb6672f8cf446": "20e1393fd6766deac6659bc87007846b",
".git/objects/fe/78a7401e61eb50b423845b8fd66ec1d533b73d": "54cf325a2b0557d36cbad142a1a32264",
".git/objects/c8/08fb85f7e1f0bf2055866aed144791a1409207": "92cdd8b3553e66b1f3185e40eb77684e",
".git/objects/4b/3c24d5114c430ea5c550cd95abd1433578b8bd": "5d85b8ae5f70cbbe428bd12f31503930",
".git/objects/16/c8cac46f4e67f0e0de500961c704d6e1352f2a": "beaeb48e33ff3f0a78ea6aa117ff3a4a",
".git/objects/1f/136b0f772a110b6c40fe564f72eb88439d51be": "ea6d6eb777538540eae2e5c33e1958f6",
".git/objects/73/c63bcf89a317ff882ba74ecb132b01c374a66f": "6ae390f0843274091d1e2838d9399c51",
".git/objects/1a/d7683b343914430a62157ebf451b9b2aa95cac": "94fdc36a022769ae6a8c6c98e87b3452",
".git/objects/8f/368292a70675725b4d450fb31a7af7e7a2465c": "f772b016eabfd2336c517d3cfb18602d",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/81/0726f286a10d7fcf1d8d619780480252963c9b": "4a0665c5c19f445bb427b45725284f6d",
".git/objects/86/d111f09a93cccfa0011858c519a823e7dafef7": "9a15839a59b5f501fbf7b9824c4b6f84",
".git/objects/43/b8efaf50bb6dc5109a5e41fc4f745d4cf1edf4": "fef48dd8e6ab38ec90f43f22c14134c9",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/9f/d17420c218195b75b67e2673b47172a407f925": "feb93a9ccd21e30987cae78a451cecfe",
".git/objects/6b/82a491abb771bc8c457904f13580213706b89c": "a8020b6ea35b59dce94d1d6297b6a30a",
".git/objects/09/a3f2e834650a687d097c6bcb47157a0cac7645": "5f071c39752b02c3f891c387be6d78e8",
".git/objects/5d/2e0e796a0b67ec0f6eb60b1841489f56c52812": "5fafcf03701f477eb758eea30c62f8d0",
".git/objects/3a/bf18c41c58c933308c244a875bf383856e103e": "30790d31a35e3622fd7b3849c9bf1894",
".git/objects/53/18a6956a86af56edbf5d2c8fdd654bcc943e88": "a686c83ba0910f09872b90fd86a98a8f",
".git/objects/53/3d2508cc1abb665366c7c8368963561d8c24e0": "4592c949830452e9c2bb87f305940304",
".git/objects/5b/ad14220ad6f7647198e4b6fbcc4cfa13de388d": "5c558e20e71c8427c2bf61939f4b814e",
".git/objects/6c/01864618fa76c24477e98c36daf075514ce2e1": "87fdc29aeca1589857beecb2866a6bc2",
".git/objects/6c/c399f9a864506228ac17fd184b2e2601fda7a5": "2429e6082a0d2a7bc9f56aea10e5d82a",
".git/objects/63/73012101aa21152e1095ee2ce6269d3c47a679": "df2e206b843096dcfdd7de634bd61ecd",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/ba/1660792c89aed61a197823d4edee4197d89ea3": "703dddd92ae8fb0f73f62b19a89279b8",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/a9/75aaf173b1838e60e561ca9b08d3514fabd23e": "636abb7e84091476225f7b0913e03482",
".git/objects/d5/801ab6053ab975f657620d6ae08c1060cee85c": "38db5f40eeed89ee4e6aad15cee87faa",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/091c97cd225118b3b0c77c08203b2c690dbde4": "2954efc6629b425ec0c5d58851b6bdaa",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/a1/e1f3ccbda75de49ba45a91031ad46865462e5a": "cbbe8483eea1d1d7b09ac06226c6e589",
".git/objects/c4/fe156f1224bc0f7cac4eacb9351e570abf6aed": "d1555154ccd3930b1cda713f5fe77614",
".git/objects/cd/3331dbd684e371f88aa92212a30b54d439118c": "b93d85e8632b2a1b70228228d5ec7c1d",
".git/objects/f1/0a7d1b327bf58bffff55434a1c07e791aabb03": "4c77a5aa397b09e2f093b4105b3b2679",
".git/objects/cb/6b7a6137f8e01d986294349a6bc2fadc6d1849": "9df7d09456db8013ef6b3c4b23309f7a",
".git/objects/e0/718d34aae35b2b15860b7c6506917456c89fca": "d4a13c138ca9dc8978ece296ea49fffa",
".git/objects/e0/7ac7b837115a3d31ed52874a73bd277791e6bf": "74ebcb23eb10724ed101c9ff99cfa39f",
".git/objects/79/87b904b0b8812d1a9da3ad6e9c5f903ca9f38a": "54ac463f4850482293da6ff1c4e7fe77",
".git/objects/2d/da06c10dd2d859db22915c5dc4ce282cbc83bf": "0ca8f8febb430206961459c1b5006658",
".git/objects/83/359069f0b4816214a87cee9acf70ab3e2fcb90": "944e9634c22261dd90e034d52a7825b2",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/70/a3b3cfcb1bbcce1fa85a38a9332b6e6e371706": "43de2665fcf2b07e67725a1224a61a86",
".git/objects/4f/090d2c9f6bdf28757c24fbbe53c8d4094b2524": "190cde9ecf20c8f41debe390bd9c5db0",
".git/objects/15/738a18a78d038169d6d2bff523abce7b1a041c": "a2e8a59a85249f06bc3ed9e0852ef182",
".git/objects/85/578905f47f9a80b4f5ad19efa101cd77e033c6": "5ede8f8594d440178d7c42816cfb5e4b",
".git/objects/85/a13fc979b0b560769480c2d85e915ba01f336d": "4382f8007eefa7d32d7dcfc6f165fbb1",
".git/objects/40/090d743a2e263a1f39315b6a0156f907809bff": "05049bfb509807ef540aa57cd4f193bc",
".git/objects/47/20d28aeb5a20b6cb5c920f6ba2ce6a5fdbe9a2": "76cf7560d3a523c536e0eb564a0559c7",
".git/objects/25/2a4f20d596eddd7a3f31c48443cfea513715e9": "150082fe6789551808d1ed6f5d187e93",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "14393e7e4a4e01c97ac66808e5c219ac",
".git/logs/refs/heads/main": "7d38c0ed63168bd78be421159e6686ba",
".git/logs/refs/remotes/origin/main": "ca25f399a53f62eade0e849086a18f0c",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "4fff1a8376f42025e1e6f04484f77ba4",
".git/refs/remotes/origin/main": "4fff1a8376f42025e1e6f04484f77ba4",
".git/index": "40fb1dfa1a3515f870a81b3cd5179826",
".git/COMMIT_EDITMSG": "10f3cc92a6c51dfe6378ecb6e9c279e0",
".git/FETCH_HEAD": "f00ba1f9a97920090045c83c6f799519",
"assets/AssetManifest.json": "99914b932bd37a50b983c5e7c90ae93b",
"assets/NOTICES": "4d7810997f99ce93a73ca2570df00d34",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "a1fee2517bf598633e2f67fcf3e26c94",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "0b0a3415aad49b6e9bf965ff578614f9",
"assets/fonts/MaterialIcons-Regular.otf": "41d90111f7adef62a0ae618d6ffa9aeb",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
