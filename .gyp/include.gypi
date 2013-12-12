{
  'variables': {
    'clang': 1,
    'component': 'shared_library',
    'linux_use_gold_binary': 1,
    'linux_use_gold_flags': 1,
    'disable_nacl': 1,
    'remoting': 0,
    'configuration_policy': 1, # chrome doesn't link with chromeos=1 when configuration_policy is 0
   },
}
