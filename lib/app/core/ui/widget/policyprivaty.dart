import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PolicyPrivacy extends StatelessWidget {

  String policyUrl;


  PolicyPrivacy({this.policyUrl = 'https://www.google.com.br'});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchPrivacyPolicy();
      },
      child: Text(
        'Política de Privacidade',
        style: TextStyle(
          color: Colors.white60,
          decoration: TextDecoration.underline,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Função para abrir a política de privacidade
  _launchPrivacyPolicy() async {
    await launch(policyUrl);
  }
}
