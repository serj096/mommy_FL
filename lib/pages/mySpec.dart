import 'package:flutter/material.dart';

class MySpec extends StatefulWidget {
  const MySpec({Key? key}) : super(key: key);

  @override
  State<MySpec> createState() => _MySpecState();
}

class _MySpecState extends State<MySpec> {
  static const String _title = 'My App';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: Scaffold(
        appBar: AppBar(title: const Text('My App')),
    body: const MyStatelessWidget(),

    ));
  }
}
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyStatelessWidgetSpec(),
    );
  }
}

class MyStatelessWidgetSpec extends StatelessWidget {
  const MyStatelessWidgetSpec({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.access_time_filled_rounded) ,

              title: Text('Дарья Б'),
              subtitle: Text('ул.Бабушкина 15'),
              trailing: Icon(Icons.add_box_outlined),
            ),

          ],
        ),
      ),
    );
  }
}
