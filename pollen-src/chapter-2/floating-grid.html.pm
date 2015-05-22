#lang pollen

◊headline{Floating grid with Scss}

We have built a very basic grid system. There are many pattern-repeating code when defining the columns. We can use proprocessor to keep the code shorter for easier maintenance.

◊css{
  $columns-count: 12;
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