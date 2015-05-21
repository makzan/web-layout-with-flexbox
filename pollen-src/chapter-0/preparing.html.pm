#lang pollen

◊headline{Preparing for the workshop}

You’ll need to bring your laptop with a modern browser and your favorite code editor installed. During the workshop, we will have some hand-on exercises. You can download all the material in the following link. It contains the code, images and libraries we need.

◊link["http://flexbox.website/material/"]{http://flexbox.website/material/}

◊section{-prefix-free library}

◊link["http://leaverou.github.io/prefixfree/"]{-prefix-free} is the JS library made by ◊link["http://lea.verou.me/"]{Lea Verou}. It parses the CSS properties and apply centain vendor prefixes on the rules by determing the browser version. This library allows us to skip worrying about different syntaxes—prefixes and the old syntaxes.

◊section{Preprocessor}

The logic in CSS preprocessor provides us the DRY—Don’t repeat yourself— way to write the CSS code. We will use some SCSS code when defining the grid layout. It’s loop and list feature helps reducing the lines of code a lot. If you are using other preprocessor, you may find their equivalents in ◊link["http://pre.com"]{CSSPre.com}. If you aren’t using any preprocessor, no worry, we also provide the full CSS code. 