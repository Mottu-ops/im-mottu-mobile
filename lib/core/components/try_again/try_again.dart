import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:im_mottu_mobile/core/components/buttons/buttons.dart';
import 'package:im_mottu_mobile/core/components/text/text.dart';

class AppTryAgain {
  static Widget fullScreen({
   required BuildContext context,
      required Function() onTap,
      required bool tryAgain,
      required Widget widget
  }) {
    return tryAgain ? Center(
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
              child: Image.asset('assets/images/m4.gif'),
            ),
            const SizedBox(height: 9,),
            AppText.title(text: 'Ops...', fontSize: 21),
             const SizedBox(height: 6,),
            AppText.description(
              textAlign: TextAlign.center,
                text:
                    'Parece que o tempo de requisição demorou de mais. Vamos apagar esse universo e começar de novo'),
             const SizedBox(height: 15,),
            AppButtons.buttonSize(
                context: context, title: 'Tentar novamente', onTap: onTap)
          ],
        ),
      ),
    ) : widget;
  }

  static Widget small(
      {required BuildContext context,
      required Function() onTap,
      required bool tryAgain,
      required Widget widget}) {
    return tryAgain
        ? Row(
            children: [
              SizedBox(
                height: 120,
                child: Image.asset('assets/images/m4.gif'),
              ),
              
              Expanded(
                child: Column(
                  children: [
                    AppText.title(text: 'Ops...', fontSize: 21),
                    const SizedBox(
                      height: 3,
                    ),
                    AppText.description(
                        fontSize: 12,
                        textAlign: TextAlign.center,
                        text:
                            'Demorou muito. Vamos apagar esse universo e tentar de novo'),
                    const SizedBox(
                      height: 9,
                    ),
                    SizedBox(
                      width: 150,
                      child: AppButtons.buttonSize(
                          height: 25,
                          context: context,
                          title: 'Tentar novamente',
                          onTap: onTap),
                    )
                  ],
                ),
              ),
            ],
          )
        : widget;
  }
}
