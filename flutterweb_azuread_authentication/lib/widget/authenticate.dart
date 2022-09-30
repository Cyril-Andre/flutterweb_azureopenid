import 'package:flutter/material.dart';
import 'package:openid_client/openid_client_browser.dart' as open_id;

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {

    var tenantId = "<your tenant id>";
    var clientId = "<your app registration id>";
    var scope = "api://<your scope>";

    return Scaffold(
      appBar: AppBar(title: const Text("Authenticate with Azure AD")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Login"),
          onPressed: () {
            authenticate(Uri.parse("https://login.microsoftonline.com/$tenantId/v2.0"), clientId, [scope]);
          },
        ),
      ),
    );
  }
}

authenticate(Uri uri, String clientId, List<String> scopes) async {
  var issuer = await open_id.Issuer.discover(uri);
  var client = open_id.Client(issuer, clientId);

  var authenticator = open_id.Authenticator(client, scopes: scopes);
  await authenticator.credential;
  authenticator.authorize();
}
