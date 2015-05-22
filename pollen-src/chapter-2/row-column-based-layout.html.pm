#lang pollen

◊headline{Row-columns-based layout}

◊sidenote{
  ◊figure["http://makzan.net/assets/mobile-web-design/row-column-grid-6113c4d65e2f9513a6603b7999c5adb4.png"]{Row and column layout}
}

Before building our Flexbox layout, we revisit the traditional float-based grid layout. One of the easiest approach to implement grid is using the row-columns approach.

◊time-for-action{Build our own minimal float-based grid layout}

◊sidenote{
  I assumed we have a basic norimalization or CSS reset applied to the page.
}

◊(steps
  ◊step{At first, we define the following rules that prevents our layout broken by box-model or extra-large images.
    ◊css{
      /* Border box */
      * {box-sizing: border-box;}
      
      /* Prevent image breaking our layout */
      img {max-width: 100%;}
    }
  }
  ◊step{Then we define the basic row-column properties that construct the foundation.
    ◊css{
      /* Grid: row */
      .row {
        width: 100%;
        max-width: 600px;
        margin: 0 auto;
        padding-top: 10px;
        padding-bottom: 10px;
        overflow: auto;
      }
      
      /* Row within column within row */
      .row .row {
        width: auto;
        max-width: none;
        margin: 0 -10px;
      }
      
      /* Grid: column */
      .col {
        padding: 0 10px;
        float:left;
      }
    }
  }
  
  ◊step{Mobile first design means that we work on the smallest layout first.
    ◊sidenote{
      To make the code simpler, I’m using 4-columns in the code example. In production, we may want to use a 12 or 16 columns. Actually we will switch to 12-columns In next step when using Scss to generate our CSS code.
    }
  
    ◊css{ 
      /* Dividing into columns */
      @media screen  {
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
    }
  }
  ◊step{After the ◊em{small} layout, we define the ◊em{medium} which overrides the smaller layout configure if presented in the HTML.
    ◊css{
      @media screen and (min-width: 600px) {
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
)

◊section{Using our grid system}

The following HTML is an example showing our grid system.

◊sidenote{The HTML code only shows the grid structure. You may need to include the proper HTML structure with <head> and includes the CSS styles}

◊markup{
  <div class="row">
    <div class="small-12 col">Float based layout</div>  
  </div>
  <nav class="row">
    <div class="small-12 col">
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Clients</a></li>
        <li><a href="#">Contact Us</a></li>
      </ul>
    </div>  
  </nav> 
  <div class="row">
    <main class="small-4 medium-3 col">
      <h1>Headnig of main content</h1>
      <p>Main content goes here.</p>
      <p>Main content goes here.</p>
      <p>Main content goes here.</p>
      <p>Main content goes here.</p>
    </main>
    <aside class="small-4 medium-1 col">
      <p>Aside content goes here.</p>
      <img src="http://placehold.it/500x300" alt="placeholder">
      <img src="http://placehold.it/500x300" alt="placeholder">
    </aside>
  </div>
  <footer>
    <div class="row">
      <div class="small-12 col">
        <p>This is a demo in <a href="http://flexbox.website">Web layout with Flexbox</a> workshop by <a href="http://makzan.net">makzan</a>.</p>
      </div>
    </div>
  </footer>
}

When running the page in browser, we will see the following screens.

◊(compare
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20flexbox.website/Screen%20Shot%202015-05-22%20at%2012.14.54%20PM.png"]{Web page displayed in small screen.}
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20flexbox.website/Screen%20Shot%202015-05-22%20at%2012.15.02%20PM.png"]{Web page displayed in wider screen.}
)