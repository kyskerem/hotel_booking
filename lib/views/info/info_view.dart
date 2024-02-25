// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hotel_booking_mock/utilities/clipper/fancy_clippper.dart';
import 'package:hotel_booking_mock/utilities/extension/context_extension.dart';

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  List<Widget> get myTabs => [
        const Tab(
          child: ElevatedButton(
            onPressed: null,
            child: Text(
              'Hotels',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
        const Tab(
          child: ElevatedButton(
            onPressed: null,
            child: Text(
              'Foods',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
        const Tab(
          child: ElevatedButton(
            onPressed: null,
            child: Text(
              'Activities',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Icon(Icons.share),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Icon(Icons.heart_broken),
          )
        ],
      ),
      body: Column(
        children: [
          _ImageAndInformations(context),
          _TabBar(context),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                view('assets/hotel1.jpg', 'assets/hotel2.jpg'),
                view('assets/food1.jpg', 'assets/food2.jpg'),
                view('assets/activites1.jpg', 'assets/activities2.jpg'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget view(String firstImagePath, String secondImagePath) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Scaffold(
        body: _BottomSide(
          context: context,
          firstImagePath: firstImagePath,
          secondImagePath: secondImagePath,
        ),
      ),
    );
  }

  TabBar _TabBar(BuildContext context) {
    return TabBar(
      controller: _tabController,
      onTap: (value) {
        setState(() {
          _tabController.index = value;
        });
      },
      tabs: myTabs,
    );
  }

  Stack _ImageAndInformations(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      ClipPath(
        clipper: FancyClipper(),
        child: SizedBox(
          height: context.dynamicHeight(.4),
          child: const Image(
            image: AssetImage('assets/mountain.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Center(
        child: Column(
          children: [
            Text(
              'Mountain',
              style:
                  context.textTheme.displaySmall?.copyWith(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Somewhere',
                style:
                    context.textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: context.dynamicHeight(.035),
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  onPressed: null,
                  child: Text(
                    '4.9 ⭐',
                    style: context.textTheme.labelMedium?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}

class _BottomSide extends StatelessWidget {
  const _BottomSide({
    super.key,
    required this.context,
    required this.firstImagePath,
    required this.secondImagePath,
  });

  final BuildContext context;
  final firstImagePath;
  final secondImagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _ImageContainer(
                context: context,
                firstImagePath: firstImagePath,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _ImageContainer(
                context: context,
                firstImagePath: secondImagePath,
                isSecond: true,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0, top: 16),
          child: Text(
            'DETAILS',
            textAlign: TextAlign.start,
            style: context.textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0, top: 16, right: 32),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel nunc tempus, finibus velit eu, feugiat mi. Phasellus ut vehicula quam. Mauris varius ultricies leo, sed porta mauris semper eget. In ves',
            softWrap: true,
            textAlign: TextAlign.start,
            style: context.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

class _ImageContainer extends StatelessWidget {
  _ImageContainer(
      {Key? key,
      required this.context,
      required this.firstImagePath,
      this.isSecond = false})
      : super(key: key);

  final BuildContext context;
  final bool isSecond;

  String firstImagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: context.dynamicWidth(.4),
        height: context.dynamicHeight(.25),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              fit: BoxFit.fill,
              image: AssetImage(firstImagePath),
              color: Colors.black.withAlpha(isSecond ? 130 : 0),
              colorBlendMode: BlendMode.hardLight,
            ),
            isSecond
                ? Positioned.fromRelativeRect(
                    rect: const RelativeRect.fromLTRB(55, 78, 0, 0),
                    child: Text(
                      '10+',
                      style: context.textTheme.displaySmall
                          ?.copyWith(color: Colors.white),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
