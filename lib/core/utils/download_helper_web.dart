import 'dart:html' as html;

void downloadCV() {
  final url = 'assets/assets/files/hamed-hossam-cv.pdf';
  final anchorElement = html.AnchorElement(href: url);
  anchorElement.download = 'hamed-hossam-cv.pdf';
  anchorElement.click();
}
