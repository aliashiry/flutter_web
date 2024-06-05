
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/data/model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  Articles news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
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
                    backgroundColor: Colors.grey,
                  )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            news.author ?? "",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color:Colors.grey,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(news.title ?? "",
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 10,
          ),
          Text(
            news.publishedAt ?? "",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.grey,
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}