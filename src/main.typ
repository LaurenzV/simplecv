#import "simplecv.typ": template, education_entry, work_entry, skill_entry

// Change the margins of the cv.
#set page(margin: (x: 1.5cm, y: 0.5cm))

// Change the overall text size of the cv. Might be useful if you want to add/remove content so that everything still stays on one page.
#set text(12pt)

// Change the font of the cv.
#set text("Linux Libertine")

// Change the theme color of the cv.
#let color = blue

// Change to your name.
#let name = "John Doe"

// Change the shown contact data. You can also change the order of the elements so that they will show up in a different order. Currently, only these five elements are available with icons, but you can add new ones by editing the template.
#let contact_data = (
  (
    "service": "linkedin",
    "display": "John Doe",
    "link": "https://www.linkedin.com/in/JohnDoe"
  ),
  (
    "service": "email",
    "display": "john@johndoe.com",
    "link": "mailto://john@johndoe.com"
  ),
  (
    "service": "phone",
    "display": "+1 123 456 789",
    "link": "tel:+1 123 456 789"
  ),
  (
    "service": "github",
    "display": "JohnDoe",
    "link": "https://github.com/JohnDoe"
  ),
  (
    "service": "website",
    "display": "mywebsite.com",
    "link": "https://mywebsite.com"
  )
)

// Leave this unchanged. This puts the name and contact data in the right spot.
#show: doc => template(name, contact_data, color, doc)

// Starting from here, you can add as much content as you want. This represents the main content of the cv.
= Education
#education_entry("Computer Science", "ETH Zürich",
degree_title: "MSc.", start_date: "Sep 2016", end_date: "Jul 2018",
description: lorem(9), location: "Zurich, Switzerland")

#education_entry("Computer Science", "Stanford University",
degree_title: "BSc.", start_date: "Sep 2012", end_date: "Jul 2016",
description: lorem(12), location: "California, USA")

= Experience
#work_entry("Senior Software Engineer", "Microsoft", start_date: "Since Nov 2021", tasks: (
  lorem(7),
  lorem(13),
  lorem(9)
),
location: "Seattle, USA")

#work_entry("Senior Software Engineer", "Apple", start_date: "Jan 2020", end_date: "Oct 2021", tasks: (
  lorem(4),
  lorem(6),
  lorem(14)
  ),
location: "California, USA")

#work_entry("Junior Software Engineer", "Google", start_date: "Oct 2018", end_date: "Nov 2019", tasks: (
  lorem(8),
  lorem(12),
  lorem(3)
  ),
location: "Zurich, Switzerland")

= Projects
*Project 1*. #lorem(40)

*Project 2*. #lorem(32)

*Project 3*. #lorem(40)

= Skills
// Ratings won't be displayed in this template.
#skill_entry("Technologies",
  (
    "Git",
    "C++",
     "Python",
    "Typst",
    "JavaScript",
    "Vue.js",
  )
)

#skill_entry("Languages",
  (
    "English",
    "German",
    "Spanish",
    "Japanese",
  )
)