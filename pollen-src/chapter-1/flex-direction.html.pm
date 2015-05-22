#lang pollen

◊headline{flex-direction}

In Flexbox, we control how items are placed within the container. A container is a box with X and Y axis. The Flexbox’s property name doesn’t use X, Y, Left, Top wordings. It’s because we can set ◊code{flex-direction} to control the ◊em{Main Axis}. The other axis is called ◊em{Cross Axis}.

◊css{
  .container{
    flex-direction: row; /* Align from left to right. */
  }
}

◊css{
  .container{
    flex-direction: column; /* Align from top to bottom. */
  }
}

◊section{align and justify}

We can now better unterstand the ◊em{align} and ◊em{justify} after we learn the direction concept. ◊code{align-items} aligns items on the cross axis and ◊code{justify-content} algins items on the main axis.

Think about justifying a text in word processor. Noramlly we write the text for left to right. Let’s assume this is as same as having a ◊code{row} direction for our text content. When we click the ◊em{left}, ◊em{center}, ◊em{right} or ◊em{justify} alignment buttons on the toolbar, we can move the content in the row direction. This is what ◊code{justify-content} means—How the content itself aligns in the main axis.

Once we know ◊code{justify-content} is for the main axis, we know ◊code{align-items} is for the other one.







