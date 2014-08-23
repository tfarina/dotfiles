{
  'variables': {
    # TODO: Move clang and component to GYP_DEFINES, so it is easier to change.
    'clang': 1,
    'component': 'shared_library',
    'linux_use_gold_binary': 1,
    'linux_use_gold_flags': 1,
    'enable_remoting_host': 1,
    'disable_nacl': 1,
    'configuration_policy': 1, # chrome doesn't link with chromeos=1 when configuration_policy is 0
   },
}
