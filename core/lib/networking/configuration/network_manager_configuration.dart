class NetworkManagerConfiguration {
  final String? proxy;
  final bool enabledProxyman;
  final bool isAllMockEnabled;

  NetworkManagerConfiguration({
    this.proxy,
    this.enabledProxyman = false,
    this.isAllMockEnabled = false,
  });
}
