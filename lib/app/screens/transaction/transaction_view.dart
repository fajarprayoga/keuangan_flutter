import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keuangan_flutter/app/core/constans/value.dart';
import 'package:keuangan_flutter/app/providers/topic/topic_provider.dart';

class TransactionView extends ConsumerWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final state = ref.watch(topicProvider);
        return state.when(
            data: (topics) {
              if (topics.isEmpty) {
                return Center(
                  child: Text("No Data"),
                );
              }
              return SafeArea(
                child: Container(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    children: [
                      Text("List Of Topic"),
                      SizedBox(
                        height: SzHeight,
                      ),
                      ListView(
                          shrinkWrap: true,
                          children: List.generate(topics.length, (index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: SzHeight),
                              padding: EdgeInsets.all(padding),
                              decoration:
                                  BoxDecoration(color: colors['listColor']),
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      topics[index].name.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Icon(Icons.arrow_right)
                                  ],
                                ),
                              ),
                            );
                          })),
                    ],
                  ),
                ),
              );
            },
            error: (e, s) => Center(
                  child: Text("Error: $e"),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ));
      }),
    );
  }
}
