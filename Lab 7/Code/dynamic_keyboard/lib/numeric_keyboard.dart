import 'package:flutter/material.dart';

// KeyPad widget
// This widget is reusable and its buttons are customizable (color, size)
class NumPad extends StatelessWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;
  final Function onSubmit;

  const NumPad({
    Key? key,
    this.buttonSize = 70,
    this.buttonColor = Colors.indigo,
    this.iconColor = Colors.amber,
    required this.delete,
    required this.onSubmit,
    required this.controller,
  }) : super(key: key);

  List<Widget> getbuttons(List numbers, int start) {
    List<Widget> numbuttons = [
      NumberButton(
        number: numbers[start],
        size: buttonSize,
        color: buttonColor,
        controller: controller,
      ),
      NumberButton(
        number: numbers[start + 1],
        size: buttonSize,
        color: buttonColor,
        controller: controller,
      ),
      NumberButton(
        number: numbers[start + 2],
        size: buttonSize,
        color: buttonColor,
        controller: controller,
      ),
    ];
    return numbuttons;
  }

  List<List<Widget>> numbuttons() {
    List numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

    numbers.shuffle();
    List<Widget> Row1 = getbuttons(numbers, 0);
    List<Widget> Row2 = getbuttons(numbers, 3);
    List<Widget> Row3 = getbuttons(numbers, 6);

    List<Widget> Row4 = [
      NumberButton(
        number: numbers[9],
        size: buttonSize,
        color: buttonColor,
        controller: controller,
      )
    ];

    List<List<Widget>> buttons = [Row1, Row2, Row3, Row4];

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    List<List<Widget>> numericbuttons = numbuttons();

    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // implement the number keys (from 0 to 9) with the NumberButton widget
            // the NumberButton widget is defined in the bottom of this file
            children: numericbuttons[0],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: numericbuttons[1],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: numericbuttons[2],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // this button is used to delete the last number
              IconButton(
                onPressed: () => delete(),
                icon: Icon(
                  Icons.backspace,
                  color: iconColor,
                ),
                iconSize: buttonSize,
              ),
              numericbuttons[3][0],
              // this button is used to submit the entered value
              IconButton(
                onPressed: () => onSubmit(),
                icon: Icon(
                  Icons.done_rounded,
                  color: iconColor,
                ),
                iconSize: buttonSize,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// define NumberButton widget
// its shape is round
class NumberButton extends StatelessWidget {
  final int number;
  final double size;
  final Color color;
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size / 2),
          ),
        ),
        onPressed: () {
          controller.text += number.toString();
        },
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
