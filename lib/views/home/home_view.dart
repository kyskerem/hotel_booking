import 'package:flutter/material.dart';
import 'package:hotel_booking_mock/utilities/colors/app_colors.dart';
import 'package:hotel_booking_mock/utilities/extension/context_extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        children: [_upside(context), _downsideCard(context)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavItems,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ClipRRect(
        borderRadius:
            const BorderRadius.vertical(bottom: Radius.elliptical(200, 400)),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Expanded _downsideCard(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: context.dynamicWidth(1),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          color: AppColors.greyColor,
          child: _cardChilds(context),
        ),
      ),
    );
  }

  Widget _cardChilds(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Stack(alignment: Alignment.bottomRight, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(64),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image(
                  fit: BoxFit.cover,
                  width: context.dynamicWidth(.8),
                  height: context.dynamicHeight(.25),
                  image: const AssetImage('assets/mountain.jpg'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4, bottom: 4),
              child: Container(
                decoration: ShapeDecoration(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(96),
                    ),
                  ),
                  color: AppColors.blueColor,
                ),
                width: context.dynamicWidth(.4),
                height: context.dynamicHeight(.07),
              ),
            ),
            Positioned.fromRelativeRect(
              rect: const RelativeRect.fromLTRB(0, 145, 50, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '68%',
                    style: context.textTheme.bodyLarge,
                  ),
                  const Icon(Icons.price_change_outlined)
                ],
              ),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Details',
                  textAlign: TextAlign.start,
                  style: context.textTheme.titleSmall,
                ),
                const Text(
                  overflow: TextOverflow.clip,
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ante dui, faucibus vitae justo eget, fringilla porttitor mi. Curabitur facilisis,',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Padding _upside(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 8),
            child: Column(
              children: _upsideWidgets(context),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _upsideWidgets(BuildContext context) {
    return [
      ..._fields(context),
      _searchButton(context),
    ];
  }

  Padding _searchButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(AppColors.blueColor)),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Search',
              style:
                  context.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          )),
    );
  }

  List<Widget> _fields(BuildContext context) {
    return [
      TextField(
        canRequestFocus: false,
        readOnly: true,
        magnifierConfiguration: const TextMagnifierConfiguration(
            shouldDisplayHandlesInMagnifier: false),
        decoration: InputDecoration(
            labelText: 'Location',
            labelStyle: context.textTheme.bodyMedium,
            prefixIcon: const Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Icon(Icons.search),
            ),
            suffixIcon: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Icon(Icons.format_list_bulleted))),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextField(
            canRequestFocus: false,
            readOnly: true,
            magnifierConfiguration: const TextMagnifierConfiguration(
                shouldDisplayHandlesInMagnifier: false),
            decoration: InputDecoration(
              labelText: 'July 08 - July 15',
              labelStyle: context.textTheme.bodyMedium,
              prefixIcon: const Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Icon(Icons.date_range_outlined),
              ),
            )),
      ),
      TextField(
          canRequestFocus: false,
          readOnly: true,
          magnifierConfiguration: const TextMagnifierConfiguration(
              shouldDisplayHandlesInMagnifier: false),
          decoration: InputDecoration(
            labelText: '2 Guests',
            labelStyle: context.textTheme.bodyMedium,
            prefixIcon: const Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Icon(Icons.people_alt_outlined),
            ),
            suffixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              ],
            ),
          )),
    ];
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        child:
            CircleAvatar(child: Image(image: AssetImage('assets/avatar.png'))),
      ),
      title: Center(
        child: Text("Hello,User",
            style: context.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold)),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: IconButton(
              onPressed: () {
                print('You have new notification');
              },
              icon: const Icon(Icons.notifications)),
        )
      ],
    );
  }

  List<BottomNavigationBarItem> get _bottomNavItems {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_2_outlined),
        label: '',
      )
    ];
  }
}
