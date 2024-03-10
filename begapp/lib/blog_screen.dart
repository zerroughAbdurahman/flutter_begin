import 'package:begapp/main.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class Blog {
  final String title;
  final String subtitle;
  final String content;
  final String imageUrl;

  Blog({required this.title,required this.subtitle ,required this.content, required this.imageUrl,});
}

class blogScreen extends StatelessWidget {
  blogScreen({super.key});
  final List<Blog> blogs = [
    Blog(
      title: 'War and Peace',
      subtitle: 'Leo Tolstoy',
      content: 'All the details about the book You can find them onInternet, I am sorry but I dont have time to search, Copy all the details and Paste it here but ITs a great book and You gonna love it!!!',
      imageUrl: 'assets/images/blog1.jpeg',
    ),
    Blog(
      title: 'The Subtle Art of Not giving care',
      subtitle: 'Mark Mansonn',
      content: 'All the details about the book You can find them onInternet, I am sorry but I dont have time to search, Copy all the details and Paste it here but ITs a great book and You gonna love it!!!',
      imageUrl: 'assets/images/blog2.png',
    ),
    Blog(
      title: 'Chinguitt Treasure of Sahara',
      subtitle: 'Ahmed ould Sidi',
      content: 'All the details about the book You can find them onInternet, I am sorry but I dont have time to search, Copy all the details and Paste it here but ITs a great book and You gonna love it!!!',
      imageUrl: 'assets/images/blog3.jpg',
    ),
    Blog(
      title: 'Three Men On a Boat',
      subtitle: 'Jerome K.Jerome',
      content: 'All the details about the book You can find them onInternet, I am sorry but I dont have time to search, Copy all the details and Paste it here but ITs a great book and You gonna love it!!!',
      imageUrl: 'assets/images/blog4.jpg',
    ),
    Blog(
      title: 'To Reassure My Heart',
      subtitle: 'Adham Charquawi',
      content: 'All the details about the book You can find them onInternet, I am sorry but I dont have time to search, Copy all the details and Paste it here but ITs a great book and You gonna love it!!!',
      imageUrl: 'assets/images/blog5.jpg',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog List',
      home: BlogListScreen(blogs: blogs),
    );
  }
}

class BlogListScreen extends StatelessWidget {
  final List<Blog> blogs;

  BlogListScreen({required this.blogs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog List'),
      ),
      body: Center(child :ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(blogs[index].title),
            subtitle: Text(blogs[index].subtitle),
            leading: CircleAvatar(
              backgroundImage: AssetImage(blogs[index].imageUrl),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogDetailsScreen(blog: blogs[index]),
                ),
              );
            },
          );
        },
      ),
      ),
    );
  }
}

class BlogDetailsScreen extends StatelessWidget {
  final Blog blog;

  BlogDetailsScreen({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Details'),
      ),
      body: Center(child : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(blog.imageUrl,width: 250.0,height:300.0,),
            SizedBox(height: 16),
            Text(
              blog.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(blog.content),
          ],
        ),
      ),
      ),
    );
  }
}