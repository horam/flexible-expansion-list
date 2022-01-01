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
            title: Text(data![index].title),
            subtitle: Text(data![index].subtitle),
          );
        },
        expandedItemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListTile(
              title: Text(data![index].fields.title),
              subtitle: Text(data![index].fields.value),
            ),
          );
        },
      ),
```
