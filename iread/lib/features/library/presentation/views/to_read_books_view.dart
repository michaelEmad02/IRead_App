import 'package:flutter/material.dart';
import 'package:iread/features/library/presentation/widgets/to_read_books_view_body.dart';

class ToReadBooksView extends StatelessWidget {
  const ToReadBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: ToReadBooksViewBody()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        
      ),
    );
  }
}
