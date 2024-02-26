* How to use gestures in SwiftUI
* Disabling user interactivity with allowsHitTesting()
* Triggering events repeatedly using a timer
* How to be notified when your SwiftUI app moves to the background
* Supporting specific accessibility needs with SwiftUI
* Moving views with DragGesture and offset()
* Coloring views as we swipe
* Counting down with a Timer

  **CHALLENGE**

1. _When adding a card, the text fields keep their current text. Fix that so that the textfields clear themselves after a card is added._
1. _If you drag a card to the right but not far enough to remove it, then release, you see it turn red as it slides back to the center. Why does this happen and how can you fix it? (Tip: think about the way we set offset back to 0 immediately, even though the card hasn’t animated yet. You might solve this with a ternary within a ternary, but a custom modifier will be cleaner.)_
1. _For a harder challenge: when the users gets an answer wrong, add that card goes back into the array so the user can try it again. Doing this successfully means rethinking the ForEach_ loop, because relying on simple integers isn’t enough – your cards need to be uniquely identifiable.

Still thirsty for more? Try upgrading our loading and saving code in two ways:

1. _Make it use an alternative approach to saving data, e.g. documents JSON rather than UserDefaults, or SwiftData – this is generally a good idea, so you should get practice with this._
1. _Try to find a way to centralize the loading and saving code for the cards. You might need to experiment a little to find something you like!_
