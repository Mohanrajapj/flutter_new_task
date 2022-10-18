import 'package:flutter/material.dart';

class LoadingState {
  Widget loaderWithMessage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
          width: 50,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: const Text(
              "please wait",
              style: TextStyle(
                fontFamily: 'Avenir',
              ),
            )),
      ],
    );
  }

  Widget loaderWithoutMessage() {
    return const SizedBox(
      height: 50,
      width: 50,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
