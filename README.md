
Implementation steps:

1.	In Main.storyboard search for Swipe Gesture Recognizer and add two new components to main View.
	These new components will should appear at ViewController level in hierarchy tree. They MUST NOT appear within the View tree.

2. Check each recognizer parameters. One must have direction set to Right and the other to Left.

3. Add and IBAction, in this case called detectSwipe(), and connect to both Recognizers.

4. UIScrollView must have scrolling disabled

