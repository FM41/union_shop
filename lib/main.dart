import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutUsPage(),
        '/collections': (context) => const CollectionsPage(),
        '/collections/essential': (context) => const EssentialCollectionPage(),
        '/collections/signature': (context) => const SignatureCollectionPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
                  // Top banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFF4d2963),
                    child: const Text(
                      'ESSENTIAL RANGE NOW AVAILABLE - SHOP NOW',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  // Main header
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigateToHome(context);
                            },
                            child: Image.network(
                              'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                              height: 18,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  width: 18,
                                  height: 18,
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          // Add navigation links next to the main header
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  navigateToHome(context);
                                },
                                child: Text(
                                  'Home',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        ModalRoute.of(context)?.settings.name ==
                                                '/'
                                            ? const Color(0xFF4d2963)
                                            : Colors.grey,
                                    decoration:
                                        ModalRoute.of(context)?.settings.name ==
                                                '/'
                                            ? TextDecoration.underline
                                            : TextDecoration.none,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/about');
                                },
                                child: Text(
                                  'About Us',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        ModalRoute.of(context)?.settings.name ==
                                                '/about'
                                            ? const Color.fromARGB(
                                                255, 255, 255, 255)
                                            : Colors.grey,
                                    decoration:
                                        ModalRoute.of(context)?.settings.name ==
                                                '/about'
                                            ? TextDecoration.underline
                                            : TextDecoration.none,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/collections');
                                },
                                child: Text(
                                  'Collections',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        ModalRoute.of(context)?.settings.name ==
                                                '/collections'
                                            ? const Color(0xFF4d2963)
                                            : Colors.grey,
                                    decoration:
                                        ModalRoute.of(context)?.settings.name ==
                                                '/collections'
                                            ? TextDecoration.underline
                                            : TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.person_outline,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.menu,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Hero Section
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  // Content overlay
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'ESSENTIAL RANGE',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "SHOP OUR ESSENTIAL RANGE OF PRODUCTS, PERFECT FOR STUDENTS AND EVERYDAY USE.",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: placeholderCallbackForButtons,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'BROWSE PRODUCTS',
                            style: TextStyle(fontSize: 14, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'ESSENTIAL RANGE ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final crossAxisCount =
                            MediaQuery.of(context).size.width > 600 ? 2 : 1;
                        return Column(
                          children: [
                            GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 24,
                              mainAxisSpacing: 48,
                              children: const [
                                ProductCard(
                                  title: 'Essential Hoodie',
                                  price: '£15.00',
                                  imageUrl:
                                      'https://chatgpt.com/backend-api/estuary/content?id=file_00000000458071f491a5d10e5f87caf9&ts=490201&p=fs&cid=1&sig=964cc81f14a8bc48e69ccee78787fa2ac9b980c8534e44249951f87bc1b35c95&v=0',
                                ),
                                ProductCard(
                                  title: 'Essential T-Shirt',
                                  price: '£10.00',
                                  imageUrl:
                                      'https://chatgpt.com/s/m_692f9b5c4d848191a2380c07a5bd9b4a/file_000000001520720ab7925f1931b1e005?ts=490202&p=fs&cid=1&sig=1adb17e409cbe1f03293d4b9904abdce3f95a2a1042b20013f136da7df44edeb&v=0',
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'SIGNATURE RANGE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 24),
                            GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 24,
                              mainAxisSpacing: 48,
                              children: const [
                                ProductCard(
                                  title: 'Signature Hoodie',
                                  price: '£20.00',
                                  imageUrl:
                                      'https://chatgpt.com/backend-api/estuary/content?id=file_00000000561871f49df05b5373a39fa8&ts=490202&p=fs&cid=1&sig=6df7a96f659dfc3764283e069342b1405a87cc478607ac1a3e8c39cebd11d1e1&v=0',
                                ),
                                ProductCard(
                                  title: 'Signature T-Shirt',
                                  price: '£15.00',
                                  imageUrl:
                                      'https://chatgpt.com/backend-api/estuary/content?id=file_0000000051d471f4a06a1fa3eccd50d8&ts=490202&p=fs&cid=1&sig=65a409149fecda6b5f26f8783aab8236b284ef527d7b2d08e090a96093ecf299&v=0',
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            Container(
              width: double.infinity,
              color: Colors.grey[50],
              padding: const EdgeInsets.all(24),
              child: const Text(
                '© 2024 Union Shop. All rights reserved.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String? description;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: {
            'title': title,
            'price': price,
            'imageUrl': imageUrl,
            'description': description ??
                'Soft, comfortable, 50% cotton and 50% polyester. Available in various sizes. Perfect for everyday wear and showcasing your support for the union.',
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Text(
            'Union Shop is dedicated to providing essential and signature products for students. Our mission is to offer quality, affordability, and style for everyday campus life.',
            style: TextStyle(fontSize: 18, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/collections/essential');
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        'https://chatgpt.com/backend-api/estuary/content?id=file_00000000458071f491a5d10e5f87caf9&ts=490201&p=fs&cid=1&sig=964cc81f14a8bc48e69ccee78787fa2ac9b980c8534e44249951f87bc1b35c95&v=0',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.5),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        child: Text(
                          'ESSENTIAL',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/collections/signature');
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        'https://chatgpt.com/backend-api/estuary/content?id=file_00000000561871f49df05b5373a39fa8&ts=490202&p=fs&cid=1&sig=6df7a96f659dfc3764283e069342b1405a87cc478607ac1a3e8c39cebd11d1e1&v=0',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.5),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        child: Text(
                          'SIGNATURE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EssentialCollectionPage extends StatelessWidget {
  const EssentialCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = const [
      ProductCard(
        title: 'Essential Hoodie',
        price: '£15.00',
        imageUrl:
            'https://chatgpt.com/backend-api/estuary/content?id=file_00000000458071f491a5d10e5f87caf9&ts=490201&p=fs&cid=1&sig=964cc81f14a8bc48e69ccee78787fa2ac9b980c8534e44249951f87bc1b35c95&v=0',
      ),
      ProductCard(
        title: 'Essential T-Shirt',
        price: '£10.00',
        imageUrl:
            'https://chatgpt.com/s/m_692f9b5c4d848191a2380c07a5bd9b4a/file_000000001520720ab7925f1931b1e005?ts=490202&p=fs&cid=1&sig=1adb17e409cbe1f03293d4b9904abdce3f95a2a1042b20013f136da7df44edeb&v=0',
      ),
    ];
    final crossAxisCount = MediaQuery.of(context).size.width > 600 ? 2 : 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Essential Collection'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 24,
          mainAxisSpacing: 48,
          children: products,
        ),
      ),
    );
  }
}

class SignatureCollectionPage extends StatelessWidget {
  const SignatureCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = const [
      ProductCard(
        title: 'Signature Hoodie',
        price: '£20.00',
        imageUrl:
            'https://chatgpt.com/backend-api/estuary/content?id=file_00000000561871f49df05b5373a39fa8&ts=490202&p=fs&cid=1&sig=6df7a96f659dfc3764283e069342b1405a87cc478607ac1a3e8c39cebd11d1e1&v=0',
      ),
      ProductCard(
        title: 'Signature T-Shirt',
        price: '£15.00',
        imageUrl:
            'https://chatgpt.com/backend-api/estuary/content?id=file_0000000051d471f4a06a1fa3eccd50d8&ts=490202&p=fs&cid=1&sig=65a409149fecda6b5f26f8783aab8236b284ef527d7b2d08e090a96093ecf299&v=0',
      ),
    ];
    final crossAxisCount = MediaQuery.of(context).size.width > 600 ? 2 : 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signature Collection'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 24,
          mainAxisSpacing: 48,
          children: products,
        ),
      ),
    );
  }
}
