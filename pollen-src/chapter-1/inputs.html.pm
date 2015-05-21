#lang pollen

◊headline{Inputs}

◊html{
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

◊section{Live Demo}

◊codepen["385"]{zGKPRb}
