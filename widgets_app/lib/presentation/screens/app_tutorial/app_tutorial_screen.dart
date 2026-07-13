import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Elige tu comida',
    'Dolor qui nulla Lorem in amet voluptate est consequat consectetur officia est. Lorem velit ullamco voluptate quis do laborum proident. Ad in cupidatat proident sit reprehenderit et culpa non quis veniam veniam laboris ullamco. Id proident incididunt minim eiusmod eiusmod eiusmod ullamco est ea ad do. Ullamco in mollit minim pariatur labore non sunt sit eu. Voluptate ut occaecat ut laboris aliqua minim.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rápida',
    'Pariatur velit nostrud ea magna incididunt cupidatat minim do ullamco labore. Eiusmod proident est proident quis dolor ex elit non eu labore est. Laborum consectetur exercitation tempor tempor nostrud proident ad aliqua proident voluptate cillum est. Proident fugiat sunt ipsum aliquip ex non do.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta la comida',
    'Dolore eu tempor in sunt exercitation do. Consectetur magna ullamco aute anim nulla. Ipsum nostrud ex consectetur fugiat do Lorem qui cupidatat esse nostrud. Elit quis consectetur veniam in sint excepteur esse. Elit velit tempor veniam proident.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = !endReached;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageViewController,
              physics: BouncingScrollPhysics(),
              children: slides
                  .map(
                    (data) => _Slide(
                      title: data.title,
                      caption: data.caption,
                      imageUrl: data.imageUrl,
                    ),
                  )
                  .toList(),
            ),

            Positioned(
              right: 20,
              top: 30,
              child: TextButton(
                onPressed: () => context.pop(),
                child: Text('Salir'),
              ),
            ),

            endReached
                ? Positioned(
                    bottom: 20,
                    right: 30,
                    child: FadeInRight(
                      from: 30,
                      delay: Duration(milliseconds: 500),
                      child: FilledButton(
                        onPressed: () {},
                        child: Text('Comenzar'),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            SizedBox(height: 20),
            Text(title, style: titleStyle),
            SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
