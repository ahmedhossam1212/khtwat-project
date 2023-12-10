import 'package:flutter/material.dart';
import 'package:khtwat_project/core/utils/app_colors.dart';

class Testmenu extends StatefulWidget {
  const Testmenu({super.key});

  @override
  State<Testmenu> createState() => _TestmenuState();
}

class _TestmenuState extends State<Testmenu> {
  String selectedItem = "item1";
  List itemlist = ["item1", "item2", "item3"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              items: itemlist
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style:
                              TextStyle(fontSize: 20, color: AppColors.black),
                        ),
                      ))
                  .toList(),
              onChanged: (item) => setState(() {
                selectedItem = item!;
              }),
            )
          ],
        ),
      ),
    );
  }
}
