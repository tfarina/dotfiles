solutions = [
  { "name"        : "src",
    "url"         : "http://git.chromium.org/chromium/src.git",
    "deps_file"   : ".DEPS.git",
    "managed"     : True,
    "custom_deps" : {
      "src/chrome/test/data/extensions/api_test/permissions/nacl_enabled/bin": None,
      "src/chrome/tools/test/reference_build/chrome_frame": None,
      "src/chrome/tools/test/reference_build/chrome_linux": None,
      "src/chrome/tools/test/reference_build/chrome_mac": None,
      "src/chrome/tools/test/reference_build/chrome": None,
      "src/third_party/cygwin": None,
      "src/third_party/python_24": None,
      "src/third_party/valgrind": "http://src.chromium.org/svn/trunk/deps/third_party/valgrind/binaries",
      "src/third_party/WebKit/LayoutTests": None,
      "src/webkit/data/layout_tests/LayoutTests": None,
    },
    "safesync_url": "",
  },
  { "name"        : "cros_deps",
    "url"         : "http://src.chromium.org/svn/trunk/src/tools/cros.DEPS/"
  },
]
