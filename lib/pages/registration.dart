import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../theme/styles.dart';
class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _Registration();
}

class _Registration extends State<Registration> {
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
            hintStyle: TextStyle(fontSize: 30),
            fillColor: AppTheme.colors.blueButtoncolor,
            filled: true
          ),keyboardType: TextInputType.name,textAlign: TextAlign.center),
          const SizedBox(height: 50,),
        Container(
          height: 50,
          width: 500,
          color: AppTheme.colors.blueButtoncolor,
          child:Center(
            child:
          Text('Yoursex',style: TextStyle(fontSize: 30),))),

    Container(
      height: 200,
      color: AppTheme.colors.blueButtoncolor,
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
              hintStyle: TextStyle(fontSize: 30,),
              fillColor: AppTheme.colors.blueButtoncolor,
              filled: true
          ), keyboardType: TextInputType.name,textAlign: TextAlign.center),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Использовать',style: TextStyle(fontSize: 30,)),
              IconButton(onPressed: (){}, icon: Image.asset("assets/icons/geo.png",),isSelected: false,)

            ],
          ),


          Styles.widgets.GetDefaultButton(context,"История записей", () {})
          
        ],



      ),
      )


    );
  }}
