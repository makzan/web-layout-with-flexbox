#lang pollen

◊headline{Floating grid with Scss}

We have built a very basic grid system. There are many pattern-repeating code when defining the columns. We can use proprocessor to keep the code shorter for easier maintenance.

◊css{
  $columns-count: 4;
  $breakpoint: 800px;
  @media screen {
    @for $i from 1 through $columns-count {
      .small-#{$i} {
        width: 100%/$columns-count * $i;
      }
    }
  }
  @media screen and (min-width: $breakpoint) {
    @for $i from 1 through $columns-count {
      .medium-#{$i} {
        width: 100%/$columns-count * $i;
      }
    }
  }
}

◊btw{
  Just in case you use pure-CSS, here is the CSS version of the code.width
  ◊css{
    @media screen {
      .small-1 {
        width: 25%;
      }
    
      .small-2 {
        width: 50%;
      }
    
      .small-3 {
        width: 75%;
      }
    
      .small-4 {
        width: 100%;
      }
    }
    @media screen and (min-width: 800px) {
      .medium-1 {
        width: 25%;
      }
    
      .medium-2 {
        width: 50%;
      }
    
      .medium-3 {
        width: 75%;
      }
    
      .medium-4 {
        width: 100%;
      }
    }
  }
}

◊section{Using runtime calc}

Preprocessor calculate the column’s width for us. Alternatively, we can use the ◊code{calc} to define forumla and let browser calculates the value at runtime. The following is a variant of our code that uses calc and performs the same behaviors in browser.

◊css{
  $columns-count: 4;
  @media screen {
    @for $i from 1 through $columns-count {
      .small-#{$i} {
        width: calc( 100% / #{$columns-count} * #{$i} );
      }
    }
  }
}

The CSS version:
◊css{
  @media screen {
    .small-1 {
      width: calc( 100% / 4 * 1 );
    }
  
    .small-2 {
      width: calc( 100% / 4 * 2 );
    }
  
    .small-3 {
      width: calc( 100% / 4 * 3 );
    }
  
    .small-4 {
      width: calc( 100% / 4 * 4 );
    }
  }
}  
  
  
