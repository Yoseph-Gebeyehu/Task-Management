import 'package:flutter/material.dart';

class CustomDialog {
  static Future showConfirmation({
    String? confirmText,
    required BuildContext context,
    required String title,
    required String desc,
    String? confirmBtnText,
    String? cancelBtnText,
    required Function onConfirm,
    required Function onCancel,
    Color? onConfirmColor,
  }) async {
    showDialog(
      context: context,
      builder: (context) {
        Size deviceSize = MediaQuery.of(context).size;
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: deviceSize.height * 0.032),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: deviceSize.width * 0.04,
                  fontWeight: FontWeight.w600,
                  fontFamily: Theme.of(context).textTheme.bodyLarge!.fontFamily,
                ),
              ),
              SizedBox(height: deviceSize.width * 0.02),
              Text(
                desc,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: deviceSize.width * 0.028,
                  fontFamily: Theme.of(context).textTheme.bodyLarge!.fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: deviceSize.height * 0.02),
              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () => onCancel(),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () => onConfirm(),
                          child: Text(
                            confirmText!,
                            style: TextStyle(
                              color: onConfirmColor ?? Colors.red,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
