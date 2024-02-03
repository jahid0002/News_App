import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/const/const.dart';
import 'package:news_app/seevice/newsModel.dart';

// ignore: must_be_immutable
class DetailsPage2 extends StatelessWidget {
  NewsModel newsModel;
  DetailsPage2({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: Colors.blue.shade400,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.white,
              )),
          centerTitle: true,
          title: Const.text('Details', 22, Colors.white, FontWeight.w600),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15),
            child: Column(
              children: [
                CachedNetworkImage(
                  height: 250,
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.cover,
                  imageUrl: newsModel.urlToImage.toString(),
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue.shade400,
                  )),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      color: Colors.white10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  color: Colors.black,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.all(6),
                                    child: Text(
                                      newsModel.source!.name.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(newsModel.publishedAt.toString()),
                            ],
                          ),
                          Text(
                            newsModel.author == null
                                ? ""
                                : "Author: ${newsModel.author.toString()}",
                            style: TextStyle(
                                fontSize: 17, color: Colors.blue.shade400),
                          ),
                          Text(
                            newsModel.title.toString(),
                            style: const TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  "${newsModel.description.toString()}\nsee more...",
                  style: const TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ));
  }
}
