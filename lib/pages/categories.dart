import 'package:flutter/material.dart';
import 'package:mommy/theme/app_theme.dart';
class Categories extends StatelessWidget {

  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final List<String> entries =<String>['Категория','Категория','Категория','Категория','Категория','Категория'];
    return Scaffold(
     // decoration: BoxDecoration(
      //  gradient: LinearGradient(
      //    begin: Alignment.topLeft,
        //  end: Alignment.bottomRight,
      //    colors: [AppTheme.colors.homeOneColor,AppTheme.colors.homeSecondColor]
      //  )
     // ),
     appBar: AppBar(
       title: Center( child: Text('Категории')),

     ),

      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder:(BuildContext, int index){
          return Container(
            height: 50,
            color: Colors.purple,
            child: Center(child: Text('Entry ${entries[index]}'),),
          );
        }, separatorBuilder: (BuildContext context, int index)=> const Divider() ,

      ),

    );
  }
}
