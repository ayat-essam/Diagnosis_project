import 'package:flutter/material.dart';

TextEditingController searchcontroller = TextEditingController();
SearchBar searchbarwidget(String searchTitle) {
  return SearchBar(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
    controller: searchcontroller,
    hintText: searchTitle,
    hintStyle: WidgetStateProperty.all<TextStyle>(
      TextStyle(color: Color(0xff4682fa)),
    ),
    shape: WidgetStateProperty.resolveWith<OutlinedBorder?>((
        Set<WidgetState> states,
        ) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.blue, width: 1.5),
      );
    }),
    trailing: const [Icon(Icons.search, color: Color(0xff4682FA))],
  );
}
