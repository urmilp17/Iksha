import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text(
          'Design Books',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/logo_design_love.jpg', // Replace with your image asset
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Logo Design Love: A Guide to Creating Iconic Brand Identities',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'by David Airey',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '\$9.99',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20.0),
                          Icon(Icons.star, color: Colors.amber, size: 20.0),
                          Icon(Icons.star, color: Colors.amber, size: 20.0),
                          Icon(Icons.star, color: Colors.amber, size: 20.0),
                          Icon(Icons.star_half, color: Colors.amber, size: 20.0),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '216 pages',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('BUY IT NOW'),
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  color: Colors.pink,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'In Logo Design Love, David shows you how to develop an iconic brand identity from start to finish, '
                      'using client case studies from renowned designers. In the process, he reveals how designers create '
                      'effective briefs, generate ideas, charge for their work, and collaborate with clients. David not only '
                      'shares his personal experiences working with clients, but he also provides tips for working with clients, '
                      'more insider stories, and more practical information for getting the job and getting it done right.\n\n'
                      'In Logo Design Love, David shows you how to develop an iconic brand identity from start to finish, using '
                      'client case studies from renowned designers. In the process, he reveals how designers create effective '
                      'briefs, generate ideas, charge for their work, and collaborate with clients. David not only shares his '
                      'personal experiences working with clients, but he also provides tips for working with clients, more insider '
                      'stories, and more practical information for getting the job and getting it done right.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BookDetailsPage(),
  ));
}
