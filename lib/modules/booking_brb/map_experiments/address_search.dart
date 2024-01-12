import 'package:flutter/material.dart';

class AddressSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        // close(context, textInputAction);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      // We will put the api call here
      future: null,
      builder: (context, snapshot) => query == ''
          ? Container(
              padding: EdgeInsets.all(16.0),
              child: Text('Enter your address'),
            )
          : snapshot.hasData
              ? ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                        // we will display the data returned from our future here
                        title: Text(
                          'okojksocj',
                          //snapshot.data.[index]['Id']
                        ),
                        onTap: () {
                          //close(context, snapshot.data[index]);
                        },
                      ),
                  itemCount: 18
                  //snapshot.data?.length,
                  )
              : Container(child: Text('Loading...')),
    );
  }
}
