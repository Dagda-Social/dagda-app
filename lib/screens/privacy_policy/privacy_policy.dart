import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'dagda - Privacy Policy',
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 60,
          centerTitle: false,
          titleSpacing: 80.0,
          title: const Text('dagda',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 42)),
          shadowColor: const Color.fromARGB(0, 0, 0, 0),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () => context.go('/login'),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Center(
              child: TextButton(
                onPressed: () => context.go('/register'),
                child: const Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 800,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Content(),
                        Footer(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Text(
          'Privacy Policy',
          style: TextStyle(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla venenatis tincidunt sodales. Sed sollicitudin nulla sed nulla sagittis, a scelerisque nulla pretium. Suspendisse imperdiet vestibulum dui in ullamcorper. Suspendisse venenatis nisl vel sem tincidunt vestibulum. Morbi leo mi, vestibulum a gravida et, consectetur ac nisi. Ut varius eros congue, auctor leo at, congue orci. Cras eget nulla accumsan, congue dui ac, pharetra urna. Ut quis magna ex. Mauris odio lacus, pretium vitae erat sit amet, tristique bibendum dolor. Phasellus ac viverra odio, in lacinia massa. Nam quis pellentesque tellus, id tempus arcu. Aenean in erat ac felis sollicitudin lobortis. Aenean at nibh posuere, cursus massa sit amet, commodo turpis.     \n\n     Nunc quis interdum quam. Donec venenatis aliquam facilisis. Nulla quis luctus urna. Nunc faucibus scelerisque est eu auctor. Praesent tempor nulla ut arcu ullamcorper gravida. Sed sollicitudin, ex vel maximus consequat, lorem erat tempor quam, et sagittis erat purus ac augue. Aliquam fermentum sollicitudin dignissim. Aenean nec nulla at augue ultricies congue in quis magna. Aenean maximus arcu erat, in dignissim magna posuere a. Nullam placerat eros eget interdum lacinia. Curabitur laoreet, felis id consectetur condimentum, tellus mauris fermentum mauris, nec venenatis metus lorem sed lorem. Etiam fringilla in ex id dapibus. Morbi sit amet nunc nec diam hendrerit semper. Mauris ut libero egestas, sodales erat vel, placerat nunc. Aenean maximus turpis et arcu pulvinar, nec vestibulum velit condimentum.     \n\n     In hac habitasse platea dictumst. Etiam rhoncus id massa sit amet gravida. Proin elementum orci quis tempor pharetra. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque interdum molestie dapibus. Vivamus vel pulvinar magna. Aliquam erat volutpat. Suspendisse luctus pretium magna ut ullamcorper. Quisque vel gravida ante. Cras porttitor lacinia volutpat. Pellentesque cursus libero vitae odio volutpat, ac commodo sapien ullamcorper. Vestibulum viverra, dolor et interdum sagittis, lorem mauris scelerisque sapien, rutrum gravida sapien felis ut massa.     \n\n     Aenean fringilla tempor dui in facilisis. Etiam cursus odio in tempus rutrum. Proin pretium lectus sit amet dictum fermentum. Donec egestas, lacus quis scelerisque pellentesque, ex tortor viverra sem, eu rutrum est lectus eu sapien. Nulla malesuada placerat erat quis condimentum. Mauris id dui eu purus tincidunt rutrum sed vel quam. Sed rhoncus erat elit, et laoreet elit tempor sed. Curabitur vitae nisi neque.     \n\n     Etiam turpis tortor, bibendum eget augue vel, faucibus tristique justo. Duis consequat orci eros, ac porttitor lacus pellentesque id. Fusce in ante at odio tempus convallis ullamcorper pulvinar nisi. Ut bibendum ante in arcu ultricies pulvinar. Suspendisse potenti. Vivamus condimentum id dui vel sodales. Nunc varius pretium eros non tristique. Curabitur suscipit consectetur semper. Aenean sed lorem sagittis, egestas urna vel, eleifend nulla. Vestibulum consequat, erat vitae sagittis porta, magna lacus consequat nisl, nec ornare nisl risus eget libero. Donec id sem efficitur, sollicitudin magna sit amet, ullamcorper magna. Morbi interdum dui at convallis eleifend. Maecenas condimentum mattis diam, varius lacinia elit ultricies eu. Curabitur vehicula vitae leo sed tempor. Maecenas eu finibus libero. Fusce vel maximus libero.',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        SizedBox(
          height: 40,
        ),
        Text(
          'Last updated: 2022-12-09',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
