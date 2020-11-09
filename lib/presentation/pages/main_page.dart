import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigation_example/logic/get_books.dart';
import 'package:navigation_example/models/book.dart';

class MainPage extends StatefulWidget {
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {

  int _index = 0;
  List<Book> books = GetBooks.books;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel'),
        backgroundColor: Colors.orange,
      ),
    body: Container(
      height:350,

      child: PageView.builder(
        controller: PageController(viewportFraction: 0.55),
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        onPageChanged: (int index){
          print(_index.toString());
          setState(() {
            _index = index;
          });
          print(_index.toString());
        },
        itemBuilder: (BuildContext context, int index){
          Book book = books[index];
          return Transform.scale(
            scale: _index == index ? 1 : 0.9,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      height: 260,
                      width: 180,
                      image: AssetImage(book.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('${book.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _index == index ? 17 : 12,
                      fontWeight: _index == index ? FontWeight.bold : FontWeight.normal,
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('${book.author}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: _index == index ? 13 : 10,
                        fontWeight: _index == index ? FontWeight.bold : FontWeight.normal,
                      ),),
                  )
                ],),
              ),
            ),
          );
        },
      ),
    )
    );
  }
}
