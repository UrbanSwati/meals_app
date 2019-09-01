import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters-screen';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluten = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactose = false;

  @override
  void initState() { 
    _gluten = widget.currentFilters['gluten'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _lactose = widget.currentFilters['lactose'];

    super.initState();
    
  }

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final finalFilters = {
                'gluten': _gluten,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'lactose': _lactose,
              };

              widget.saveFilters(finalFilters);
            },
          )
        ],
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
                    _gluten, (bool value) {
                  setState(() {
                    _gluten = value;
                  });
                }),
                buildSwitchTitle(
                    'Lactose-Free',
                    'Only include lactose free meals',
                    _lactose, (bool value) {
                  setState(() {
                    _lactose = value;
                  });
                }),
                buildSwitchTitle(
                    'Vegan-Free', 'Only include vegan free meals', _vegan,
                    (bool value) {
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
