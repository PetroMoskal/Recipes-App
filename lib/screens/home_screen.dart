import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/recipe_model.dart';
import '../provider/recipes_provider.dart';
import '../widgets/recipe_item.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  HomeScreen(this.title);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

bool _isInit = true;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Items>(context, listen: false).fetchItems();
      _isInit = false;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final List<Recipe> list = Provider.of<Items>(context).items;
    final bool isLoading = Provider.of<Items>(context).isLoading;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : SingleChildScrollView(
              child: Column(
                children: list
                    .map((e) => SingleChildScrollView(child: RecipeItem(e)))
                    .toList(),
              ),
            ),
    );
  }
}
