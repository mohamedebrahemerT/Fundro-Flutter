bool isUpdateRequired(String currentVersion, String apiVersion) {
  List<int> currentParts =
      currentVersion.split('.').map((e) => int.tryParse(e) ?? 0).toList();
  List<int> apiParts =
      apiVersion.split('.').map((e) => int.tryParse(e) ?? 0).toList();

  while (currentParts.length < apiParts.length) {
    currentParts.add(0);
  }
  while (apiParts.length < currentParts.length) {
    apiParts.add(0);
  }

  for (int i = 0; i < apiParts.length; i++) {
    if (apiParts[i] > currentParts[i]) return true;
    if (apiParts[i] < currentParts[i]) return false;
  }
  return false;
}
