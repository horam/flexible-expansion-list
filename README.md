<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
## Flutter Expansion List
A Flutter package to provide Expandable List with customizable animation
and List items.

## Example Project

There is a good example project in the example folder. 

## Usage

```dart
       FlexibleExpansionList(
        itemCount: data!.length,
        headerBuilder: (BuildContext context, int index, bool isExpanded) {
          return ListTile(
            title: Text(isExpanded ? 'Collapse' : 'Expand'),
          );
        },
        fixedItemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(data![index].fields.title),
            subtitle: Text(data![index].fields.value),
          );
        },
        expandedItemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListTile(
              title: Text(data![index].title),
              subtitle: Text(data![index].subtitle),
            ),
          );
        },
      ),
```
