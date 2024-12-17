import 'dart:io';
import 'dart:typed_data';
import 'package:hive/hive.dart';
import 'package:iread/features/home/domain/entities/book_entity.dart';
import 'package:pdf_render/pdf_render.dart' as pdf_render;
import 'package:iread/features/home/data/models/book_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:image/image.dart' as img;

class LocalStorageServices {
  final List<String> _bookExtensions = ['.pdf', '.epub'];
  final String _directoryPath = '/storage/emulated/0/Download/';

  Future<List<File>> getBooksFiles() async {
    // Request storage permissions
    if (await Permission.storage.request().isGranted) {
      // Specify the directory to scan (Android-specific)

      final Directory rootDir = Directory(_directoryPath);
      var entities = rootDir
          .listSync(recursive: true, followLinks: false)
          .whereType<File>()
          .where(
              (file) => _bookExtensions.any((ext) => file.path.endsWith(ext)));
      return entities.toList();
    } else {
      print("Storage permission denied");
      return [];
    }
  }

  Future<List<BookModel>> getBooksInDevice() async {
    List<BookModel> books = [];
    // Add more extensions if needed.

    // Request storage permissions
    if (await Permission.storage.request().isGranted) {
      // Specify the directory to scan (Android-specific)

      final Directory rootDir = Directory(_directoryPath);
      books = await _searchBooksInDirectory(rootDir, _bookExtensions);
    } else if (await Permission.manageExternalStorage.isGranted) {
      final Directory rootDir = Directory(_directoryPath);
      books = await _searchBooksInDirectory(rootDir, _bookExtensions);
    } else {
      print("Storage permission denied");
    }

    return books;
  }

  Future<List<BookModel>> _searchBooksInDirectory(
      Directory dir, List<String> extensions) async {
    List<BookModel> books = [];
    // Traverse the directory contents
    var entities = dir
        .listSync(recursive: true, followLinks: false)
        .whereType<File>()
        .where((file) => _bookExtensions.any((ext) => file.path.endsWith(ext)));
    for (var entity in entities) {
      // Check file extension

      final doc = await pdf_render.PdfDocument.openFile(entity.path);

      final page = await doc.getPage(1); // Get the first page
      final pageImage = await page.render();
      var pagesCount = doc.pageCount;
      doc.dispose();
      var image = convertToPng(
          pageImage.pixels, page.width.toInt(), page.height.toInt());
      page.document.dispose();

      books.add(BookModel(
        name: entity.uri.pathSegments.last,
        // bookTitle: data.documentInformation.title,
        //bookAuthor: data.documentInformation.author,
        bookImage: image,
        bookPagesCount: pagesCount,
        bookLoaclPath: entity.path, bookTitle: entity.uri.pathSegments.last,
        //size: "${entity.lengthSync()} bytes",
      ));
    }
    var box = Hive.box<BookEntity>('BooksBox');
    box.addAll(books);
    return books;
  }

  Uint8List convertToPng(Uint8List rawPixels, int width, int height) {
    /* final image = img.Image.fromBytes(
        width: width, height: height, bytes: rawPixels.buffer);
    return Uint8List.fromList(img.encodeJpg(image));*/
    final image = img.Image(
      width: width,
      height: height,
    );

    // Iterate over raw pixel data
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        int index = (y * width + x) * 4; // RGBA is 4 bytes per pixel
        int r = rawPixels[index]; // Red channel
        int g = rawPixels[index + 1]; // Green channel
        int b = rawPixels[index + 2]; // Blue channel
        int a = 255; // Set alpha to fully opaque

        // Add the pixel to the image
        image.setPixel(x, y, img.ColorInt32.rgba(r, g, b, a));
      }
    }

    // Encode the image as PNG
    return Uint8List.fromList(img.encodePng(image));
  }

  Future<PdfDocument> _getPdfMetadata(String filePath) async {
    File pdfFile = File(filePath);
    List<int> bytes = await pdfFile.readAsBytes();
    return PdfDocument(inputBytes: bytes);
  }

  Future<Uint8List> _getPdfCoverImage(String filePath) async {
    final doc = await pdf_render.PdfDocument.openFile(filePath);
    final page = await doc.getPage(1); // Get the first page
    final pageImage = await page.render();

    doc.dispose();

    return convertToPng(
        pageImage.pixels, page.width.toInt(), page.height.toInt());
  }

  /* Future<List<BookEntity>> getLatestBooks({
    int limit = 10,
  }) async {
    List<BookEntity> books = [];
    final directory = Directory(_directoryPath);

    // Ensure the directory exists
    if (await directory.exists()) {
      // List all files and filter by extensions
      final files = directory
          .listSync(recursive: true)
          .whereType<File>()
          .where(
              (file) => _bookExtensions.any((ext) => file.path.endsWith(ext)))
          .toList();

      // Sort files by modification date (newest first)
      files.sort(
          (a, b) => b.statSync().modified.compareTo(a.statSync().modified));

      // Take the top `limit` results
      var entities = files.take(limit).toList();

      for (var entity in entities) {
        // Check file extension

        var data = await _getPdfMetadata(entity.path);
        var image = await _getPdfCoverImage(entity.path);
        books.add(BookModel(
            name: entity.uri.pathSegments.last,
            bookTitle: data.documentInformation.title,
            bookAuthor: data.documentInformation.author,
            bookImage: image,
            bookPagesCount: data.pages.count,
            bookLoaclPath: entity.path,
            size: "${entity.lengthSync()} bytes"));
      }
      return books;
    }
    return books;
  }*/
}
