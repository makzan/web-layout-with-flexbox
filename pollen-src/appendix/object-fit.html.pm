#lang pollen

◊headline{Object-fit}


Object-fit provides us ◊code{cover} and ◊code{contain} control which is similar to ◊code{background-size}. The difference is that background image is a decoration that happens in CSS. Object-fit, on the other hand, applies to <img> tag. An img tag is treated as content and hence it keeps the accessibility.


◊css{
  figure {
    padding: 5px;
    
    img {
      width: 100%;
      height: 200px;
      object-fit: cover;
    }
    
    figcaption {
      text-align: center;
    }
  }
}

◊codepen["700"]{pvKeOb}