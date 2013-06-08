{
  'variables': {
    'clang': 1,
    'component': 'shared_library', #static_library
    'linux_use_gold_binary': 1,
    'linux_use_gold_flags': 1,
    'chromeos': 1, # build with toolkit_views/aura instead of gtk.
    'remove_webcore_debug_symbols': 0,
    'disable_nacl': 1,
    'enable_svg': 0,
    'remoting': 0,
    'configuration_policy': 1, # chrome doesn't link with chromeos=1 when configuration_policy is 0
     #'fastbuild': 1, see build/common.gypi for a description of what is this, this disables debug info!!!
   },
}
