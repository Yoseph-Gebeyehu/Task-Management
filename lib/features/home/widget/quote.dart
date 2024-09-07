import 'package:flutter/material.dart';
import 'package:task_management/data/model/quote.dart';

class QuoteWidget extends StatelessWidget {
  final Quote quote;

  const QuoteWidget({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '"${quote.content}"',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[800],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '- ${quote.author}',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueGrey[600],
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
