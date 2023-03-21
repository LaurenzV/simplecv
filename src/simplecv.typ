// Based on https://www.overleaf.com/latex/templates/autocv/scfvqfpxncwb and https://www.overleaf.com/latex/templates/faangpath-simple-template/npsfpdqnxmbc

#set list(indent: 1em)
// Reduce space between paragraphs.
#let par_space = 0.5em
// Reduce space between headings and descriptions.
#let sep_space = par_space + 0.2em

// Format start and end dates.
#let format_date(start_date: none, end_date: none) = {
  let date = {
    if end_date == none {
        start_date
      } else if start_date == none {
        end_date
      } else {
        start_date + " - " + end_date
      }
  }

  [*#date*]
}

// Format locations.
#let format_location(location) = {
  [_#block(above: sep_space, location)_]
}

// General entry that is split into a left and right half (for experience and education).
#let cv_entry(left_content: none, right_content: none) = {
    grid(
    columns: (11fr, 6fr),
    column-gutter: 1cm,
    {
      set align(left)
      left_content
    },
    {
      set align(right)
      right_content
    }
  )
}

// Entry for education.
#let education_entry(degree, university, degree_title: none, description: none, start_date: none, end_date: none, location: none) = {
  cv_entry(
    left_content:  {
      if degree_title != none {
        [*#degree_title*] + " "
      } + [*#degree*] + [ (#university)] + block(above: sep_space, par[#description])
    },
    right_content:  {
      format_date(start_date: start_date, end_date: end_date)

      if location != none {
        "\n" + format_location(location)
      }
    }
  )
}

// Entry for work.
#let work_entry(role, company, tasks: none, start_date: none, end_date: none, location: none) = {
  cv_entry(
    left_content: {
      [*#role*] + "\n" + block(above: sep_space, text[#company])

      if tasks != none {
        let tasks_list = []

        for task in tasks {
          tasks_list += [- #task]
        }

        tasks_list
      }
    },
    right_content:  {
      format_date(start_date: start_date, end_date: end_date)

      if location != none {
        "\n" + format_location(location)
      }
    }
  )
}

// Entry for skills
#let skill_entry(category, skills) = {
  [== #category]

  let cell = rect.with(radius: 5pt, inset: (top: 4pt, bottom: 4pt, left: 5pt, right: 5pt))
  let boxes = for skill in skills {(box(cell(skill)),)}

  {boxes.join("  ")}
}

// Set name and contact data and format headings
#let template(name, contact_data, color, doc) = {
  set page(margin: (x: 1.5cm, y: 0.5cm))
  set text(11pt)
  set par(justify: true, leading: par_space)
  align(center)[
    #smallcaps(text(size: 2.5em, fill: color)[#name]) \

    #{
      if contact_data != none and contact_data.len() > 0 {
        let elements = for el in contact_data {
          (link(el.link)[#{box(image(height: 0.7em, el.service + ".svg")) + " " + el.display}],)
        }
        elements.join(" | ")
      }
    }
  ]

  show heading.where(level: 1): i => {
    set align(left)
    let title = smallcaps(i.body)

    set block(above: 1em)
      set text(weight: "light", size: 1.2em, fill: color)
      stack(
        dir: ttb,
        spacing: 2mm,
        title,
        line(length: 100%, stroke: color + 2pt)
    )
  }

  show heading.where(level: 2): i => {
    set align(left)
    let title = smallcaps(i.body)
    set block(above: 0.8em)
    set text(weight: "light", size: 1.1em, fill: color)
    title
  }

  doc
}