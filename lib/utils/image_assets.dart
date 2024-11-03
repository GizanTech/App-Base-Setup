class ImageAssets {
  ImageAssets._();

  final image = 'assets/images';
  final icon = 'assets/icons';

 String getImage(String fileName) {
    return '$image$fileName';
  }
   String getIcon(String fileName) {
    return '$icon$fileName';
  }
}