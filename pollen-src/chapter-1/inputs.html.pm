#lang pollen

◊headline{Inputs}

With the grow and shrink feature, we can define items that shrinks to its content’s width, and the main input will take all the rest of the space.

◊sidenote{
  ◊figure["https://dl.dropboxusercontent.com/u/3079250/Public%20for%20flexbox.website/Screen%20Shot%202015-05-22%20at%2012.28.50%20PM.png"]{The result running in browser.}
}

◊time-for-action{Creating an input form with prefix and postfix}

◊(steps

  ◊step{
    First, we create the following HTML markup.
    
    ◊markup{
      <div class="container">
        <form>
          <fieldset>
            <label for="twitter-handle">Twitter:</label>
            <div class="input">
              <span>@</span>
              <input type="text" id="twitter-handle" placeholder="username" autofocus>
            </div>
          </fieldset>
          <fieldset>
            <label for="twitter-handle">Create your domain:</label>
            <div class="input">        
              <input type="text" id="twitter-handle" placeholder="www">
              <span>.makzan.net</span>
            </div>
          </fieldset>
          <input type="submit" value="Done">
        </form>
      </div>
    }
  }
  
  ◊step{Then we just need few lines of flex code to make it works. Display flex, grow, shrink, and Done.

    ◊css{
      .input {
        display: flex;
      }
      .input > span {
        flex: 0 1 auto;  
      }
      .input > input {
        flex: 1;
      }
    }
  }
  
  ◊step{Well, I actually applied more styles to make the input looks nice. I added the following code to archive the screenshot we show at the beginning. They are not our focus, but I include it so you see how we can make our inputs more easily to use by using padding.

    ◊css{
      /* Container flexbox */
      .container {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
      }
      
      
      /* Not our focus */
      fieldset{
        border: none;
        padding: 0;
        margin: 1em 0;
      }
      
      .input > span {
        display: block;
        background: #efefef;
        padding: 0.5em;
      }
      .input > input {
        padding: 0.5em;
      }
      
      input[type="submit"] {
        width: 100%;
        padding: 0.5em;
      }
    }
  }
)

◊section{Live Demo}

You may find the live demo of the code in the following codepen entry.

◊codepen["385"]{zGKPRb}
