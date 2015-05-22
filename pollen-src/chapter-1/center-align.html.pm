#lang pollen

◊headline{Center align}

Center alignment is one of the most discussed topic in CSS. Flexbox provides a easy and elegant way to solve this layout issue.

◊sidenote{
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20flexbox.website/Screen%20Shot%202015-05-22%20at%202.24.06%20AM.png"]{The result of center-aligned item inside the container.}
}

◊section{Example—Center aligning one item}

◊markup{
  <div class="container">
    <div class="item">Center aligned.</div>
  </div>
}

◊css{
  .container {
    display: flex;
  }
  .item {
    margin: auto;
  }
}

The beautify of ◊code{margin: auto} on the child items is that it automatically spread the items across the space with equivalent margins.

◊section{Example—Distribute multiple items in container}

Thanks to the ◊code{margin: auto}, the browser automatically distribute all the items inside the flexbox container equally.

◊markup{
  <div class="container">
    <div class="item">Item.</div>
    <div class="item">Item.</div>
    <div class="item">Item.</div>
  </div>
}

◊section{Using align-items and justify-content}

Alternatively, we can configure the alignment in the container by using the ◊code{align-items} and ◊code{justify-content} properties.

◊css{
  .container {
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .item {
    /* No need to specify the alignment in children */
  }
}

◊section{Example—Center aligning multiple items}

By using the container’s alignment options, we can center align multiple items together.

◊markup{
  html, body {
    height: 100%
  }
  .container {
    display: flex;
    height: 100%;

    align-items: center;
    justify-content: center;

    flex-direction: column;
  }
  .box {
    height: 50px;
    width: 300px;
    margin: 0.2em;
  }
}

◊codepen["368"]{dopZxX}

