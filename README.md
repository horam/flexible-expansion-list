## Flutter Expansion List
A Flutter package to provide Expandable List with customizable animation
and List items.

## Example Project

There is a good example project in the example folder. 

## Demo

![expansion_list](https://user-images.githubusercontent.com/13411466/147857567-5b6a1f3f-09a5-4e66-9a56-9394e24083b1.gif)

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
        }
      ),
```
