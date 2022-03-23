import 'package:flutter/material.dart';
import 'package:vbt_food_challange/core/constant/strings/commentcontainer_string.dart';

class StarsWidget extends StatelessWidget {
  const StarsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < 5; i++)
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                const Text(CustomContainerString.date),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(CustomContainerString.tittleText),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}