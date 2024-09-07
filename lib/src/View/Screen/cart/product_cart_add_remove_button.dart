import 'package:flutter/material.dart';

import '../../../Utils/app_dimensions.dart';
import '../../../Widgets/icons/circular_icon.dart';

class TProductQuantityAddRwmoveButton extends StatelessWidget {
  const TProductQuantityAddRwmoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Icons.minimize,
          width: Dimensions.width30 + 2,
          height: Dimensions.height30 + 2,
          size: 12,
          color: Colors.black,
          backgroundColor: Colors.grey[300],
        ),
        SizedBox(width: Dimensions.width10),
        Text(
          '2',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(width: Dimensions.width10),
        TCircularIcon(
          icon: Icons.add,
          width: Dimensions.width30 + 2,
          height: Dimensions.height30 + 2,
          size: 12,
          color: Colors.white,
          backgroundColor: Colors.black,
        ),
      ],
    );
  }
}
