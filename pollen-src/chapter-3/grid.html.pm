#lang pollen

◊headline{Implementation of the grid}

We have learned the basic functionality of using Flexbox. We also learned the traditional float-based grid layout. Now we are ready to create our own Flexbox layout based on what we learned.

◊time-for-action{Migrating our grid into Flexbox}

◊(steps
  ◊step{Our basic CSS hasn’t changed much. We changed the ◊code{.row} into ◊code{display:flex} with ◊code{flex-wrap}. The other parts are same as the float-based grid.
  
    ◊css{
      /* Border box */
      * {
        box-sizing: border-box;
      }
      
      img {
        max-width: 100%;
      }
      
      /* Grid */
      .row {
        /* if you need a largest width */
        width: 1920px;
        max-width: 100%;
        margin: 0 auto;
      
        display: flex;
        flex-wrap: wrap;
      }
      .row .row {
        margin-left: -10px;
        margin-right: -10px;
        width: auto;
        max-width: none;
      }
      
      .col {
        padding: 0 10px;
        min-width: 0;
        
        border: 1px dashed LIGHTGRAY; /* for debugging */
      }
    }
  }
  ◊step{
    
    ◊sidenote{◊code{flex: 0 1 50%} means ◊code{flex-grow:0}, ◊code{flex-shrink:1} and ◊code{flex-basis:50%}}
    
    Our final outcome is to replace the ◊code{width} in column with something like ◊code{flex: 0 1 50%;} and ◊code{flex: 0 1 100%;}. The pertentage acts as the desired width value. But we don’t define the width. We define the ◊code{flex-basis} which is essentially the ◊code{min-width} of the element. Flexbox will calculate how much space each item takes based on this value.
  }
  
  ◊step{
    It’s very easy to define our ◊em{mobile-first grid system} by using the Scss’s list, loop and variable. In the code, we not only define the columns’ width, we also define classes for ◊em{auto expand}, ◊em{shrink}, ◊em{vertical direction} and ◊em{horizontal direction}. An extra ◊em{hidden} class allows us to hide element in smaller screen.

    ◊css{
      $columns-count: 12;
      $screen-sizes: small medium large xlarge xxlarge;
      $breakpoints: 0 500px 1000px 1200px 1600px;
      @for $i from 1 through length($screen-sizes) {
        @media screen and (min-width: nth($breakpoints, $i)){
          .#{nth($screen-sizes, $i)}-vertical { flex-direction:column; }
          .#{nth($screen-sizes, $i)}-horizontal { flex-direction:row; }
          .#{nth($screen-sizes, $i)}-hidden { display: none; }
          .#{nth($screen-sizes, $i)}-auto   { display: block; flex: 1}
          .#{nth($screen-sizes, $i)}-shrink { display: block; flex: 0 1 auto}
          @for $j from 1 through $columns-count {
            .#{nth($screen-sizes, $i)}-#{$j} {
              display: block; 
              flex: 0 1 calc( 100% / #{$columns-count} * #{$j} );
            }
          }    
        }  
      }
    }
  }
)


◊section{Implementation of block grid}

Block grid is a grid system that we define how many items per roles inside the container. It trys to evenly distribute the items into the container within the items-limitation per role.

◊css{
  /* Block grid */
  .block-grid {
    display: flex;
    flex-wrap: wrap;
  }
  .block-grid > * { flex: 1; }
  @for $i from 1 through length($screen-sizes) {
    @media screen and (min-width: nth($breakpoints, $i)){   
      @for $j from 2 through 10 {
        .block-grid.#{nth($screen-sizes, $i)}-up-to-#{$j} > * {
          flex: 0 1 calc( 100% / #{$j} );
        }
      }
    }
  }
}



◊section{HTML that uses the grid}

◊sidenote{
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20flexbox.website/Screen%20Shot%202015-05-22%20at%201.51.12%20PM.png"]{Our web layout.}
}

◊markup{
  <header>
    <div class="row">
      <div class="small-12 col">
        <h1>Cake Shop</h1>
      </div>
    </div>
  </header>
  <div class="row">
    <nav class="small-12 medium-shrink xxlarge-2 col">
      <ul class="block-grid medium-vertical">
        <li><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Clients</a></li>
        <li><a href="#">Contact Us</a></li>
      </ul>
    </nav>  
    <aside class="small-hidden large-shrink xxlarge-2 col">
      <p>Sections</p>
      <ol>
        <li><strong>Section 1</strong>
          <ol>
            <li>Section 1.1</li>
          </ol>
        </li>      
        <li>Section 2</li>
        <li>Section 3</li>
      </ol>  
    </aside>
    <main class="small-12 medium-auto col">
      <article>
        <h1>Main Heading of the article</h1>
        <p>Introducing of the essay goes here.</p>
        <h2>Section 1—Photos</h2>
        <p>You’ll find a couple of images in the following that shows the flexbox-based block-grid system.</p>
        <div class="block-grid small-up-to-2 medium-up-to-3">
          <figure>
            <img src="http://placehold.it/300x300" alt="placeholder image" />
            <figcaption>This is a placeholder.</figcaption>
          </figure>
          <figure>
            <img src="http://placehold.it/350x300" alt="placeholder image" />
            <figcaption>This is a placeholder.</figcaption>
          </figure>
          <figure>
            <img src="http://placehold.it/700x400" alt="placeholder image" />
            <figcaption>This is a placeholder.</figcaption>
          </figure>
          <figure>
            <img src="http://placehold.it/500x300" alt="placeholder image" />
            <figcaption>This is a placeholder.</figcaption>
          </figure>
          <figure>
            <img src="http://placehold.it/500x600" alt="placeholder image" />
            <figcaption>This is a placeholder.</figcaption>
          </figure>
          <figure>
            <img src="http://placehold.it/300x300" alt="placeholder image" />
            <figcaption>This is a placeholder.</figcaption>
          </figure>
          <figure>
            <img src="http://placehold.it/300x300" alt="placeholder image" />
            <figcaption>This is a placeholder.</figcaption>
          </figure>
          <figure>
            <img src="http://placehold.it/300x300" alt="placeholder image" />
            <figcaption>This is a placeholder.</figcaption>
          </figure>
        </div>
        <h3>1.1 Sub section</h3> 
        <p>This is a paragraph of section 1.1. It’s the sub-section that conclude the section 1.</p>
        <h2>2. Section 2</h2>
        <p>We create more sections. An essay usually contains more than 1 section. This is the reason we put section 2 here.</p>
        <h2>3. Summary</h2>
        <p>This section summerize the entire article.</p>
      </article>
    </main>
    <div class="advertisement row">
      <div class="small-hidden xlarge-shrink col">
        <img src="http://placehold.it/160x600&text=ad." alt="Advertisement" />
      </div>
    </div>
  </div>  
  <footer>
    <div class="row">
      <div class="small-12 col">
        CC0 Do anything license.
      </div>
    </div>
  </footer>
}

◊section{Result and live demo}

Here is the final result we get:
  
◊(compare
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20flexbox.website/Screen%20Shot%202015-05-22%20at%201.50.45%20PM.png"]{In small screen.}
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20flexbox.website/Screen%20Shot%202015-05-22%20at%201.50.53%20PM.png"]{In medium screen.}
)

◊(compare
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20flexbox.website/Screen%20Shot%202015-05-22%20at%201.51.02%20PM.png"]{In large screen.}
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20flexbox.website/Screen%20Shot%202015-05-22%20at%201.51.12%20PM.png"]{In extra large screen.}
)

◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20flexbox.website/Screen%20Shot%202015-05-22%20at%201.51.19%20PM.png"]{In xx-large screen.}


You can find the final code in the following CodePen demo.

◊codepen["500"]{GJjMEL}