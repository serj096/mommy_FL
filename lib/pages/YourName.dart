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
          mainAxisAlignment: MainAxisAlignment.center,

        children: [
          TextField(decoration: InputDecoration(
          hintText: 'Укажите ваше имя',
            hintStyle: Styles.text.AllocationText,
            fillColor: AppTheme.colors.blueButtoncolor,
            filled: true
          ),keyboardType: TextInputType.name,textAlign: TextAlign.center),
          const SizedBox(height: 50),
        Container(
          height: 50,
          width: 500,
          color: AppTheme.colors.blueButtoncolor,
          child:Center(
            child:
          Text('Укажите ваш пол',style: Styles.text.AllocationText,))),

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
              hintStyle: Styles.text.AllocationText,
              fillColor: AppTheme.colors.blueButtoncolor,
              filled: true
          ), keyboardType: TextInputType.name,textAlign: TextAlign.center),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Использовать',style: Styles.text.InformationText),
              IconButton(onPressed: (){}, icon: Image.asset("assets/icons/geo.png",),isSelected: false,)

            ],
          ),


          Styles.widgets.GetDefaultButton(context,"История записей", () {})
          
        ],



      ),
      )


    );
  }}
