#lang pollen

◊headline{Implementation of the grid}

It’s very easy to define our ◊em{mobile-first grid system} by using the Scss’s list, loop and variable.

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

◊headline{Implementation of block grid}

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

◊headline{HTML that uses the grid}

◊html{
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