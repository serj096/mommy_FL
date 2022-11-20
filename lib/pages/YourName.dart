import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../theme/styles.dart';
class YourName extends StatefulWidget {
  const YourName({Key? key}) : super(key: key);

  @override
  State<YourName> createState() => _YourName();
}

class _YourName extends State<YourName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(

            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppTheme.colors.homeOneColor,AppTheme.colors.homeSecondColor]
            )

        ),
        alignment: Alignment.center,
        child:
        Column(
        children: [
          const SizedBox(height: 200,),
          TextField(decoration: InputDecoration(
          hintText: 'Yourname',
            hintStyle: TextStyle(fontSize: 30,color: AppTheme.colors.fontColors),
            fillColor: AppTheme.colors.tfColors,
            filled: true
          ),keyboardType: TextInputType.name,textAlign: TextAlign.center),
          const SizedBox(height: 50,),
        Container(
          height: 50,
          width: 500,
          color: AppTheme.colors.tfColors,
          child:Center(
            child:
          Text('Yoursex',style: TextStyle(color: AppTheme.colors.fontColors,fontSize: 30),))),

    Container(
      height: 200,
      color: AppTheme.colors.tfColors,
      child:
          Row(


            mainAxisAlignment: MainAxisAlignment.center,


            children:  <Widget>[


            Expanded(
              child: IconButton(onPressed: (){}, icon: Image.asset("assets/icons/manIcon.png"),isSelected: false,)),
            Expanded(child: IconButton(onPressed: (){}, icon: Image.asset("assets/icons/womanIcon.png"), isSelected: true,))

          ],),),
          const SizedBox(height: 50,),
          TextField(decoration: InputDecoration(

              hintText: 'Укажите ваш город',
              hintStyle: TextStyle(fontSize: 30,color: AppTheme.colors.fontColors),
              fillColor: AppTheme.colors.tfColors,
              filled: true
          ), keyboardType: TextInputType.name,textAlign: TextAlign.center),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Использовать',style: TextStyle(color: AppTheme.colors.fontColors,fontSize: 30,)),
              IconButton(onPressed: (){}, icon: Image.asset("assets/icons/geo.png",),isSelected: false,)

            ],
          ),

          Styles().DefaultPadding,
          Styles().GetDefaultButton("Продолжить", () {}),
          
        ],



      ),
      )


    );
  }}
