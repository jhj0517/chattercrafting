import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(1),
      child: const Center(
        child: CircularProgressIndicator(
          color: ColorConstants.themeColor,
        ),
      ),
    );
  }
}

class PurchaseProcessingView extends StatelessWidget {
  const PurchaseProcessingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ModalBarrier(dismissible: false, color: Colors.black.withOpacity(0.5)),
        const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
