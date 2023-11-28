import 'package:flutter/material.dart';
import 'package:target/app/core/ui/theme/themeconfig.dart';
import 'package:target/app/page/login_page.dart';

class TargetApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TargetAppState();
}

class TargetAppState extends State<TargetApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeConfig.getLoginTheme(),
      debugShowCheckedModeBanner: false,
      // Utiliza as configurações do tema definidas em ThemeConfig
      home: Scaffold(
        // Utiliza o gradiente de fundo definido em ThemeConfig
        body: Container(
          decoration: ThemeConfig.getGradientBackground(),
          child: LoginPage(),
        ),
      ),
    );
  }
}
