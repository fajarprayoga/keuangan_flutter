import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keuangan_flutter/app/core/constans/value.dart';
import 'package:keuangan_flutter/app/data/services/local/storage.dart';
import 'package:keuangan_flutter/app/providers/app_provider.dart';
import 'package:keuangan_flutter/app/screens/account/account_view.dart';
import 'package:keuangan_flutter/app/screens/home/home_view.dart';
import 'package:keuangan_flutter/app/screens/transaction/transaction_view.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // prefs.remove('token');
    // list with type data widget pages
    List<Widget> pages = const [HomeView(), TransactionView(), AccountView()];

    return Scaffold(
      body: Consumer(builder: (context, ref, _) {
        return Stack(
          children: List<Widget>.generate(pages.length, (int index) {
            bool isActive = ref.watch(appStateProvider).page == index;
            return IgnorePointer(
              ignoring: !isActive,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 250),
                opacity: isActive ? 1 : 0,
                child: Navigator(
                  onGenerateRoute: (RouteSettings settings) {
                    return MaterialPageRoute(
                        builder: (_) => pages[index], settings: settings);
                  },
                ),
              ),
            );
          }),
        );
      }),
      bottomNavigationBar: Consumer(builder: (context, ref, _) {
        int page = ref.watch(appStateProvider).page;
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black12),
                ),
              ),
              child: IntrinsicHeight(
                  child: Row(
                children: [
                  ...List.generate(pages.length, (index) {
                    bool isActive = page == index;

                    List<IconData> icons = [
                      Icons.home,
                      Icons.payments,
                      Icons.person,
                    ];

                    Color color = isActive ? Colors.black87 : Colors.black26;
                    return Expanded(
                        child: InkWell(
                      focusColor: Colors.white,
                      hoverColor: Colors.white,
                      onTap: () {
                        final notifier = ref.read(appStateProvider.notifier);
                        notifier.navigateTo(index);
                      },
                      child: Container(
                        padding: EdgeInsets.all(padding),
                        child: Icon(
                          icons[index],
                          color: color,
                        ),
                      ),
                    ));
                  })
                ],
              )),
            ),
            AnimatedPositioned(
              curve: Curves.easeInBack,
              top: 0,
              left: MediaQuery.of(context).size.width / pages.length * page,
              duration: Duration(milliseconds: 350),
              child: Container(
                  height: 2,
                  color: Colors.blueAccent,
                  width: MediaQuery.of(context).size.width / pages.length),
            )
          ],
        );
      }),
    );
  }
}
