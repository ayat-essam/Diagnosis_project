import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Core/Routing/routes.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(Routers.SliderBar);
                },
                icon: Icon(Icons.calendar_view_day_rounded))
          ],
        ),
      ),
    );
  }
}
