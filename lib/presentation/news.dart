
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/data/model/NewsResponse.dart';

class News extends StatelessWidget {
  Articles news;

  News({required this.news});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.50,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.30,
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Color(0xff39a552),
                    )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(news.title ?? "",
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}