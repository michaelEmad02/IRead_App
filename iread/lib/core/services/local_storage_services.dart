import 'dart:io';
import 'dart:typed_data';
import 'package:pdf_render/pdf_render.dart' as pdf_render;
import 'package:iread/features/home/data/models/book_model.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class LocalStorageServices {
  Future<List<BookModel>> getBooksInDevice() async {
    List<BookModel> books = [];
    final List<String> bookExtensions = [
      '.pdf',
      '.epub'
    ]; // Add more extensions if needed.

    // Request storage permissions
    //  if (await Permission.storage.request().isGranted) {
    // Specify the directory to scan (Android-specific)
    Directory rootDir = Directory('/storage/emulated/0/');
    books = await _searchBooksInDirectory(rootDir, bookExtensions);

    //} else {
    //  print("Storage permission denied");
    //}

    return books;
  }

  Future<List<BookModel>> _searchBooksInDirectory(
      Directory dir, List<String> extensions) async {
    List<BookModel> books = [];
    // Traverse the directory contents
    var entities = dir.listSync(recursive: true, followLinks: false);
    for (var entity in entities) {
      if (entity is File) {
        // Check file extension
        if (extensions.contains(entity.path.split('.').last.toLowerCase())) {
          var data = await getPdfMetadata(entity.path);
          var image = await getPdfCoverImage(entity.path);
          books.add(BookModel(
              name: entity.uri.pathSegments.last,
              bookTitle: data.documentInformation.title,
              bookAuthor: data.documentInformation.author,
              bookImage: image,
              bookPagesCount: data.pages.count,
              bookLoaclPath: entity.path,
              size: "${entity.lengthSync()} bytes"));
        }
      }
    }
    return books;
  }

  Future<PdfDocument> getPdfMetadata(String filePath) async {
    File pdfFile = File(filePath);
    List<int> bytes = await pdfFile.readAsBytes();
    return PdfDocument(inputBytes: bytes);
  }

  Future<Uint8List> getPdfCoverImage(String filePath) async {
    final doc = await pdf_render.PdfDocument.openFile(filePath);
    final page = await doc.getPage(1); // Get the first page
    final pageImage = await page.render(
      width: page.width as int,
      height: page.height as int,
    );

    doc.dispose();

    return pageImage.pixels;
  }
}
