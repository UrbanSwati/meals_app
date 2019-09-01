import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters-screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget buildSwitchTitle(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Adjust your selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchTitle(
                    'Gluten-Free',
                    'Only include gluten free meals',
                    _glutenFree, (bool value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                buildSwitchTitle(
                    'Lactose-Free',
                    'Only include lactose free meals',
                    _lactoseFree, (bool value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
                buildSwitchTitle(
                    'Vegan-Free',
                    'Only include vegan free meals',
                    _vegan, (bool value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
                buildSwitchTitle(
                    'Vegetarian-Free',
                    'Only include Vegetarian free meals',
                    _vegetarian, (bool value) {
                  setState(() {
                    _vegetarian = value;
                  });
                })
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
