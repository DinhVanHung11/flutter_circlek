import 'package:app/components/mixins.dart';
import 'package:app/components/product/product_review_list.dart';
import 'package:app/provider/review_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductReview extends StatefulWidget {
  ProductReview({super.key, required this.data});
  
  final dynamic data;

  @override
  State<ProductReview> createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReview> {
  late Future _dataReviewFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dataReviewFuture = Provider.of<ReviewProvider>(context).readJson();
  }

  @override
  Widget build(BuildContext context) {
    var listReviews = Provider.of<ReviewProvider>(context, listen: false).getReviewProductId(widget.data.id);

    return FutureBuilder(
      future: _dataReviewFuture,

      builder: (context, snapshot) {
        return snapshot.hasData ? Column(
          children: [
            HeadingUnderline(title: "Đánh giá", dataRating: widget.data, textCenter: false,hasReview: true, iconDown: true),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ReviewList(data: listReviews),
            ),
          ],
        ) : Center(child: Text("Hãy trở thành người đầu tiên đánh giá sản phẩm này!"));
      },
    );
  }
}