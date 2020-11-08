import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_example/logic/get_books.dart';
import 'package:navigation_example/models/book.dart';

class MainPage extends StatefulWidget {
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  GetBooks getbooks = GetBooks();
  List<Book> books = GetBooks.books;
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 360,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.55),
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  onPageChanged: (int index) {
                    print(_index.toString());
                    setState(() => _index = index);
                    print(_index.toString());
                  },
                  itemBuilder: (BuildContext context, int index) {
                    Book book = books[index];
                    return Transform.scale(
                      scale: index == _index ? 1 : 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image(
                                  height: 250.0,
                                  width: 180.0,
                                  image: AssetImage(book.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${book.name}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: index == _index ? 15 : 12,
                                    fontWeight: index == _index
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${book.author}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: index == _index ? 12 : 8,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
