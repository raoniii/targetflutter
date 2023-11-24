import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PolicyPrivacy extends StatelessWidget {
  final String policyUrl;

  PolicyPrivacy(this.policyUrl);

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
      ),
    );
  }

  // Função para abrir a política de privacidade
  _launchPrivacyPolicy() async {
    await launch(policyUrl);
  }
}
