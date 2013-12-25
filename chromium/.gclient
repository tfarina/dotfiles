solutions = [
  { "name"        : "src",
    "url"         : "https://chromium.googlesource.com/chromium/src.git",
    "deps_file"   : ".DEPS.git",
    "managed"     : False,
    "custom_deps" : {
      "src/chrome/test/data/extensions/api_test/permissions/nacl_enabled/bin": None,
      "src/chrome/tools/test/reference_build/chrome_frame": None,
      "src/chrome/tools/test/reference_build/chrome_linux": None,
      "src/chrome/tools/test/reference_build/chrome_mac": None,
      "src/chrome/tools/test/reference_build/chrome": None,
      "src/third_party/cygwin": None,
      "src/third_party/python_24": None,
      #"src/third_party/valgrind": "http://src.chromium.org/svn/trunk/deps/third_party/valgrind/binaries",
      "src/third_party/WebKit/LayoutTests": None,
      "src/webkit/data/layout_tests/LayoutTests": None,
    },
    "safesync_url": "",
  },
]
target_os = ['android']
