#lang pollen

◊headline{Floating grid}


Revisiting the grid layout with ◊em{float}.

Row column grid system.

◊css{
  $columns-count: 12;
  @media screen {
    @for $i from 1 through $columns-count {
      .col-#{$i} {
        width: 100%/$columns-count * $i;
      }
    }
  }
}

Calculated result:
◊css{
  @media screen {
    .col-1 {
      width: 8.33333%;
    }
  
    .col-2 {
      width: 16.66667%;
    }
  
    .col-3 {
      width: 25%;
    }
  
    .col-4 {
      width: 33.33333%;
    }
  
    .col-5 {
      width: 41.66667%;
    }
  
    .col-6 {
      width: 50%;
    }
  
    .col-7 {
      width: 58.33333%;
    }
  
    .col-8 {
      width: 66.66667%;
    }
  
    .col-9 {
      width: 75%;
    }
  
    .col-10 {
      width: 83.33333%;
    }
  
    .col-11 {
      width: 91.66667%;
    }
  
    .col-12 {
      width: 100%;
    }
  }
}

◊section{Applying mobile first approach}

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