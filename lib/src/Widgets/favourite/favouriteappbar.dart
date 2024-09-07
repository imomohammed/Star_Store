import 'package:flutter/material.dart';


class FavoruiteAppBar extends StatelessWidget {
  const FavoruiteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, size: 30,
              color: Colors.purple[200],),
          ),
          const Padding(padding: EdgeInsets.only(left: 20),
            child: Text("favourite", style: TextStyle(color: Colors.purple,
                fontSize: 20,
                fontWeight: FontWeight.bold),),
          ),
          const Spacer(),
          const Icon(Icons.more_vert, size: 30, color: Colors.purple,)
        ],
      ),

    );
  }
}


