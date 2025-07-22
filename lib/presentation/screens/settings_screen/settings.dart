import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sudocu/presentation/custom_widgets/custom_app_bar.dart';
import 'package:sudocu/presentation/custom_widgets/huge_text_widget.dart';
import 'package:sudocu/router/app_router.gr.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme.dart';

@RoutePage()
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isNotificationOn = true; // State for the Notification toggle

  @override
  Widget build(BuildContext context) {
    final colors = SudocuColorTheme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        left: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              context.router.pop();
            },
            child: Icon(Icons.arrow_back, size: 40, color: colors.secondary),
          ),
        ),
      ),
      backgroundColor: colors.backgroundPrimary,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: HugeTextWidget(text: 'SETTINGS')),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => context.router.push(RulesRoute()),
              child: Text(
                'Privacy and Terms',
                textAlign: TextAlign.center,
                style: TextStyle(color: colors.primary, fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            Divider(color: colors.secondary),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notification',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: colors.primary, fontSize: 20),
                ),
                SizedBox(
                  height: 40,
                  width: 60,
                  child: Switch(
                    value: _isNotificationOn,
                    onChanged: (bool newValue) {
                      setState(() {
                        _isNotificationOn = newValue;
                      });
                    },
                    activeColor: Colors.white,
                    inactiveThumbColor: colors.backgroundPrimary,
                    inactiveTrackColor: Colors.white, 
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
