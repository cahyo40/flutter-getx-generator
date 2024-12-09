abstract class AppAssets {
  baseAssets(String assets);
}

class ImageAssets implements AppAssets {
  @override
  baseAssets(String assets) {
    return "assets/images/$assets";
  }
}

class JsonAssets implements AppAssets {
  @override
  baseAssets(String assets) {
    return "assets/json/$assets";
  }
}
