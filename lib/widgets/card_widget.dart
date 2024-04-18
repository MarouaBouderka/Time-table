import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String label;
  final double progress;
  final String imageAsset;
  final Color color;

  const CardWidget({
    Key? key,
    required this.label,
    required this.progress,
    required this.imageAsset,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      width: 300,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    100), // Adjust border radius as needed
                side: const BorderSide(
                  color: Color.fromARGB(255, 50, 230, 183),
                  width: 2,
                ),
              ),
              tileColor: Theme.of(context).colorScheme.secondary,
              title: Text(
                "$label",
                style: const TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 219, 219, 219)),
              ),
              subtitle: Text(
                '${(progress * 100).toStringAsFixed(0)}%',
                style: const TextStyle(
                  color: Color.fromARGB(255, 219, 219, 219),
                  fontSize: 16,
                ),
              ),
              leading: Image.asset(
                imageAsset,
              ),
              trailing: SizedBox(
                  height: 200,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: SizedBox(
                      width: 100, // Adjust height of the progress indicator
                      child: LinearProgressIndicator(
                        value: progress,
                        color: color,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

