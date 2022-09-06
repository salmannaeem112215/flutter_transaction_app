import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final String spendingAmount;
  final double spendingPicOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPicOfTotal);

  @override
  Widget build(BuildContext context) {
    print(spendingPicOfTotal);

    return LayoutBuilder(builder: ((ctx, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(spendingAmount))),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPicOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.015,
          ),
          Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(label))),
        ],
      );
    }));
  }
}
