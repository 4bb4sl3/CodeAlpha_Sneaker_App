import 'package:flutter/material.dart';
import 'package:codealpha_sneakerapp/models/cart.dart';
import 'package:provider/provider.dart';
import '../models/shoe.dart';
import '../components/shoe_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    //alert the user, shoe successfully added to cart
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Succesfully  added to cart!'),
            content: Text('Check your cart!'),
          ),
    );
  }

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        // Filter the shoe list based on the search query
        List<Shoe> filteredShoes =
            value
                .getShoeList()
                .where(
                  (shoe) => shoe.name.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ),
                )
                .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for sneakers...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (query) {
                  setState(() {
                    searchQuery = query;
                  });
                },
              ),
            ),

            //message
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Everyone flies.. some fly longer than others',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            //hot picks
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'Hot Picks🔥',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // list of shoes for sale
            Expanded(
              child: ListView.builder(
                itemCount: filteredShoes.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // get a shoe from the filtered list
                  Shoe shoe = filteredShoes[index];

                  // return the shoe
                  return ShoeTile(shoe: shoe, onTap: () => addShoeToCart(shoe));
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
              child: Divider(color: Colors.white),
            ),
          ],
        );
      },
    );
  }
}
