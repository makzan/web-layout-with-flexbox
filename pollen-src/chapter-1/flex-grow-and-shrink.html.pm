#lang pollen

◊headline{Flex grow and shrink}

When we’re building the grid layout, we need to master another concept of flexbox—◊em{grow} and ◊em{shrink}.

◊section{flex-grow}

Grow defines how the items expand to takes the extra spaces. Grow affects the items when there are empty spaces in the container. Grow defines the ratio each item should expand. Given value 1 on all items mean each one of them should take equaly width, or height, depends on the ◊code{flex-direction}.

◊css{
  flex: 1;
}

◊section{flex-shrink}

Shrink is how each item should squeeze when the container is smaller. Having value 1 on all items means all items shrinks equally.

◊css{
  flex: 0 1 auto;
}

◊section{Applying grow and shrink}

Given the following HTML structure:

◊markup{
  <div class="container">
    <header>
      Header goes here.
    </header>
    <main>
      <p>Main content.</p>
      <p>Main content.</p>
      <p>Main content.</p>
      <p>Main content.</p>
      ...
    </main>
    <footer>
      Footer goes here.
    </footer>
  </div>
}

We can make the header and footer shrink to its content height. Then we make the main content auto expand to take up all the spaces.

◊sidenote{
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20flexbox.website/Screen%20Shot%202015-05-22%20at%2012.24.39%20PM.png"]{Our code running in small screen.}
}

◊css{
  html, body {
    height: 100%;
  }
  .container {
    display: flex;
    flex-direction: column;
    height: 100%;
  }
  header, footer {
    flex: 0 1 auto;
  }
  main {
    flex: 1;
    overflow: scroll;
    -webkit-overflow-scrolling:touch;
  }
}

You may also find the live code in the following codepen demo.

◊codepen["400"]{mJrqzO}


