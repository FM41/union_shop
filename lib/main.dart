import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';

void main() {
  runApp(const UnionShopApp());
}

// Add a simple cart model (global for demo purposes)
List<Map<String, String>> cartItems = [];

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
        '/sale': (context) => const SalePage(),
        '/signin': (context) => const SignInPage(), // <-- Add this line
        '/all-products': (context) => const AllProductsPage(), // <-- Add this line
        '/cart': (context) => const CartPage(), // <-- Add this line
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
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/sale');
                                },
                                child: const Text(
                                  'SALE!!',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    decoration: TextDecoration.underline,
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
                                  icon:
                                      const Icon(Icons.person), // <-- Add icon
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/signin');
                                  },
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
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/cart');
                                  },
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/all-products');
                          },
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
              // --- Removed the Add to Cart button here ---
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

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  double discountedPrice(String price) {
    // Remove currency symbol and parse
    final value = double.tryParse(price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0;
    final discounted = value * 0.6;
    return discounted;
  }

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'title': 'Essential Hoodie',
        'price': '£15.00',
        'imageUrl':
            'https://chatgpt.com/backend-api/estuary/content?id=file_00000000458071f491a5d10e5f87caf9&ts=490201&p=fs&cid=1&sig=964cc81f14a8bc48e69ccee78787fa2ac9b980c8534e44249951f87bc1b35c95&v=0',
      },
      {
        'title': 'Essential T-Shirt',
        'price': '£10.00',
        'imageUrl':
            'https://chatgpt.com/s/m_692f9b5c4d848191a2380c07a5bd9b4a/file_000000001520720ab7925f1931b1e005?ts=490202&p=fs&cid=1&sig=1adb17e409cbe1f03293d4b9904abdce3f95a2a1042b20013f136da7df44edeb&v=0',
      },
      {
        'title': 'Signature Hoodie',
        'price': '£20.00',
        'imageUrl':
            'https://chatgpt.com/backend-api/estuary/content?id=file_00000000561871f49df05b5373a39fa8&ts=490202&p=fs&cid=1&sig=6df7a96f659dfc3764283e069342b1405a87cc478607ac1a3e8c39cebd11d1e1&v=0',
      },
      {
        'title': 'Signature T-Shirt',
        'price': '£15.00',
        'imageUrl':
            'https://chatgpt.com/backend-api/estuary/content?id=file_0000000051d471f4a06a1fa3eccd50d8&ts=490202&p=fs&cid=1&sig=65a409149fecda6b5f26f8783aab8236b284ef527d7b2d08e090a96093ecf299&v=0',
      },
    ];

    final crossAxisCount = MediaQuery.of(context).size.width > 600 ? 2 : 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SALE!! 40% OFF'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 24,
          mainAxisSpacing: 48,
          children: products.map((product) {
            final originalPrice = product['price']!;
            final salePrice = discountedPrice(originalPrice);
            return ProductCard(
              title: product['title']!,
              price: '£${salePrice.toStringAsFixed(2)} (was $originalPrice)',
              imageUrl: product['imageUrl']!,
              description: 'Now 40% off!',
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your email to sign in:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Handle sign in logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Signed in as ${emailController.text}')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4d2963),
                foregroundColor: Colors.white,
              ),
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({super.key});

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  String filterBy = 'All';
  String sortBy = 'Default';

  final List<Map<String, String>> products = [
    {
      'title': 'Essential Hoodie',
      'price': '£15.00',
      'imageUrl':
          'https://chatgpt.com/backend-api/estuary/content?id=file_00000000458071f491a5d10e5f87caf9&ts=490201&p=fs&cid=1&sig=964cc81f14a8bc48e69ccee78787fa2ac9b980c8534e44249951f87bc1b35c95&v=0',
      'type': 'Essential',
    },
    {
      'title': 'Essential T-Shirt',
      'price': '£10.00',
      'imageUrl':
          'https://chatgpt.com/s/m_692f9b5c4d848191a2380c07a5bd9b4a/file_000000001520720ab7925f1931b1e005?ts=490202&p=fs&cid=1&sig=1adb17e409cbe1f03293d4b9904abdce3f95a2a1042b20013f136da7df44edeb&v=0',
      'type': 'Essential',
    },
    {
      'title': 'Signature Hoodie',
      'price': '£20.00',
      'imageUrl':
          'https://chatgpt.com/backend-api/estuary/content?id=file_00000000561871f49df05b5373a39fa8&ts=490202&p=fs&cid=1&sig=6df7a96f659dfc3764283e069342b1405a87cc478607ac1a3e8c39cebd11d1e1&v=0',
      'type': 'Signature',
    },
    {
      'title': 'Signature T-Shirt',
      'price': '£15.00',
      'imageUrl':
          'https://chatgpt.com/backend-api/estuary/content?id=file_0000000051d471f4a06a1fa3eccd50d8&ts=490202&p=fs&cid=1&sig=65a409149fecda6b5f26f8783aab8236b284ef527d7b2d08e090a96093ecf299&v=0',
      'type': 'Signature',
    },
  ];

  List<Map<String, String>> get filteredProducts {
    var list = products;
    if (filterBy != 'All') {
      list = list.where((p) => p['type'] == filterBy).toList();
    }
    if (sortBy == 'Price: Low to High') {
      list.sort((a, b) =>
          double.parse(a['price']!.replaceAll(RegExp(r'[^\d.]'), ''))
              .compareTo(double.parse(b['price']!.replaceAll(RegExp(r'[^\d.]'), ''))));
    } else if (sortBy == 'Price: High to Low') {
      list.sort((a, b) =>
          double.parse(b['price']!.replaceAll(RegExp(r'[^\d.]'), ''))
              .compareTo(double.parse(a['price']!.replaceAll(RegExp(r'[^\d.]'), ''))));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = MediaQuery.of(context).size.width > 600 ? 2 : 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Filter by:', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: filterBy,
                  items: ['All', 'Essential', 'Signature']
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      filterBy = value!;
                    });
                  },
                ),
                const SizedBox(width: 32),
                const Text('Sort by:', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: sortBy,
                  items: [
                    'Default',
                    'Price: Low to High',
                    'Price: High to Low',
                  ]
                      .map((sort) => DropdownMenuItem(
                            value: sort,
                            child: Text(sort),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      sortBy = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 48,
                children: filteredProducts
                    .map((product) => ProductCard(
                          title: product['title']!,
                          price: product['price']!,
                          imageUrl: product['imageUrl']!,
                          description: 'Soft, comfortable, 50% cotton and 50% polyester. Available in various sizes.',
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(32.0),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Image.network(
                      item['imageUrl']!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image_not_supported),
                    ),
                    title: Text(item['title']!),
                    subtitle: Text(item['price']!),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeFromCart(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String selectedSize = 'M';
  int selectedAmount = 1;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final title = args?['title'] ?? 'Product';
    final price = args?['price'] ?? '';
    final imageUrl = args?['imageUrl'] ?? '';
    final description = args?['description'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                imageUrl,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    height: 200,
                    child: const Center(
                      child: Icon(Icons.image_not_supported, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text('Size:', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 16),
                DropdownButton<String>(
                  value: selectedSize,
                  items: ['XS', 'S', 'M', 'L', 'XL']
                      .map((size) => DropdownMenuItem(
                            value: size,
                            child: Text(size),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSize = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Amount:', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 16),
                DropdownButton<int>(
                  value: selectedAmount,
                  items: List.generate(10, (i) => i + 1)
                      .map((amount) => DropdownMenuItem(
                            value: amount,
                            child: Text(amount.toString()),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedAmount = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  for (int i = 0; i < selectedAmount; i++) {
                    cartItems.add({
                      'title': title,
                      'price': price,
                      'imageUrl': imageUrl,
                      'size': selectedSize,
                    });
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Added $selectedAmount x $title (Size: $selectedSize) to cart!'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4d2963),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
