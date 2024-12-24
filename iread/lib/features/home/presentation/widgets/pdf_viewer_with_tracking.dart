import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerWithSpacing extends StatefulWidget {
  final String filePath;

  const PdfViewerWithSpacing({super.key, required this.filePath});

  @override
  State<PdfViewerWithSpacing> createState() => _PdfViewerWithSpacingState();
}

/*
 showModalBottomSheet(
                  context: context,
                  isScrollControlled:
                      true, // Allows the BottomSheet to resize dynamically
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (BuildContext context) {
                    return BottomSheetWidget(controller: controller);
                  },

                );
*/
class _PdfViewerWithSpacingState extends State<PdfViewerWithSpacing> {
  Set<int> readPages = {}; // Track read pages
  late PDFViewController pdfViewController;
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PDFView(
          filePath: widget.filePath,
          enableSwipe: true,
          swipeHorizontal: false,
          autoSpacing: true, // Enable auto spacing between pages
          // Set custom spacing (in pixels)
          pageFling: true,
          onPageChanged: (int? currentPage, int? totalPages) {
            if (currentPage != null) {
              // Add the current page to the read pages
              setState(() {
                readPages.add(currentPage + 1); // Page number is 0-based
              });
            }
          },
          onViewCreated: (PDFViewController controller) {
            pdfViewController = controller;
          },
        ),
      ),
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        textDirection: TextDirection.ltr,
        controller: widget.controller,
        enableSuggestions: true,
        maxLines: 1,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          hintText: "ملاحظات",
          border: InputBorder.none,
          hintStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          //labelText: "Title",
          //labelStyle: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
