import 'package:flutter/material.dart';
import 'quote.dart';

void main() => runApp(MaterialApp(
  home:Quotes(),
));



class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {

  List<Quote> quotes = [
    Quote(1,"Be careful in your life1","Author1"),
    Quote(2,"Be careful in your life2","Author2"),
    Quote(3,"Be careful in your life3","Author3"),
    Quote(4,"Be careful in your life4","Author4"),
    
  ];



  Widget QuoteTemplate(quote) => QuoteCard(
    id: quote.id,
    quote: quote.quote,
    author: quote.author,
    delete: () {
      setState(() {
        print("dasd");
        quotes.remove(quote);
      });
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daily Quotes"),centerTitle: true,),
      body: Padding(

        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Center(
          child: Column(
            children: quotes.map((quote) => QuoteTemplate(quote)).toList()
          ),
        ),
      ),
    );
  }
}



class QuoteCard extends StatelessWidget {
  
  final String quote;
  final String author;
  final int id;
  final Function() delete;

  const QuoteCard({required this.id,required this.quote,required this.author,required this.delete});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: 350,
      height: 140,
      margin: EdgeInsets.fromLTRB(15, 0, 15, 30),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${this.quote}",
              style: TextStyle(
                fontSize: 25
              ),
            ),
            SizedBox(height: 3,),
            Text(
              "${this.author}",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 20,),

            ElevatedButton.icon(
              onPressed: delete,
              icon: Icon(Icons.delete),
              label: Text("Delete")
            )
          ],
          ),
      ),
    );
  }
}