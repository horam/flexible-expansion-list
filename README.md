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

## Properties

| Property                                              | Description                                                               | Default                                           |
| ----------------------------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------- |
| **required int** itemCount                            | Total number of fixed items.                                              | **required**                                      |
| **required IndexedWidgetBuilder** fixedItemBuilder    | Creates fixed list item widgets.                                          | **required**                                      |
| **required IndexedWidgetBuilder** expandedItemBuilder | Create The widget(s) that should be displayed when each item is expanded. | **required**                                      |
| **IndexedHeaderWidgetBuilder** headerBuilder          | Creates The widget that should be shown as the header for the whole list. | null                                              |
| **Animation<double>** animation                       | Expansion and collapse animation with a value of type double.             | CurvedAnimation                                   |
| **AnimationController** controller                    | Expansion and collapse animation controller.                              | default controller with 300 milliseconds duration |
