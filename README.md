#  iOS 14 deeplink test

This repository tries to use new `.onOpenUrl()` to deeplink to its content

It uses 3 test deeplinks:

* [testlink://talks/](testlink://talks/) 
    for tab selection
* [testlink://talks/86af4777-aba8-416c-a543-e0a3cc15e708](testlink://talks/86af4777-aba8-416c-a543-e0a3cc15e708)
    for detail visible on list (selects 5th item)
* [testlink://talks/9eb06f79-2c0b-4c83-aa9b-845807d21ebe](testlink://talks/9eb06f79-2c0b-4c83-aa9b-845807d21ebe)
    for detail invisible on list (tries to select 75th item)

currently only first two cases are working (most of the times), and last one does not work at all

Feedback to Apple describing this issue: FB8542861

If you also encounter this issue please refer to this feedback.

### TabView selection issue

Although `TabView(selection:)` can be optional when you attach to it optional @State var it will stop changing Tabs.

This works:

```swift
struct ContentView: View {
    @State var selectedSection: SectionIdentifier = .speakers

    var body: some View {
        TabView(selection: $selectedSection) {
            // ...
```

This will not work:

```swift
struct ContentView: View {
    @State var selectedSection: SectionIdentifier? = .speakers

    var body: some View {
        TabView(selection: $selectedSection) {
            // ...
```
