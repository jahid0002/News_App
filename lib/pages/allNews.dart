import 'package:flutter/material.dart';
import 'package:news_app/pages/componnent.dart';
import 'package:news_app/seevice/providerPage.dart';
import 'package:provider/provider.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  @override
  void initState() {
    super.initState();

    context.read<ProviderPage>().addlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_is_empty
      body: SafeArea(
        child: Consumer<ProviderPage>(builder: (context, provider, child) {
          if (provider.list.length == 0) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(itemBuilder: (context, index) {
            return ItemComponent(newsModel: provider.list[index]);
          });
        }),
      ),
    );
  }
}
