#set page(
  paper: "us-letter",
  flipped: true,
  margin: 0.4in,
)

#set text(font: "Liberation Sans", size: 9pt)

// Colors
#let headerbg = rgb(55, 65, 81)
#let headertext = white
#let altrow = rgb(249, 250, 251)
#let gridborder = rgb(209, 213, 219)
#let gridline = rgb(229, 231, 235)
#let labelgray = rgb(107, 114, 128)

// Checkbox commands
#let cmark = box(
  width: 0.28cm,
  height: 0.28cm,
  stroke: gridborder + 0.5pt,
  radius: 1pt,
)

#let smallcmark = box(
  width: 0.22cm,
  height: 0.22cm,
  stroke: gridborder + 0.5pt,
  radius: 0.5pt,
)

#let tinycmark = box(
  width: 0.18cm,
  height: 0.18cm,
  stroke: gridborder + 0.5pt,
  radius: 0.5pt,
)

#let moodcircle = box(
  width: 0.24cm,
  height: 0.24cm,
  stroke: gridborder + 0.5pt,
  radius: 50%,
)

#let inputline(width) = box(
  width: width,
  stroke: (bottom: gridborder + 0.4pt),
)

// Title
#align(center)[
  #text(size: 14pt, weight: "bold")[Weekly Habit Tracker]
  #h(3em)
  #text(size: 10pt)[Week of: #inputline(2.5cm)]
]

#v(0.3cm)

// Weight Graph
#align(center)[
  #box(width: 90%)[
    #text(size: 10pt, weight: "bold")[Weight]
    #h(0.3em)
    #text(size: 8pt, fill: labelgray)[(lbs)]
    #v(0.2cm)

    #grid(
      columns: (0.8cm, 1fr),
      rows: (auto,) * 7,
      gutter: 0pt,

      // Y-axis labels (blank input lines)
      ..for i in range(6) {
        (align(right)[#inputline(0.5cm)#h(0.1cm)],
         if i == 0 {
           box(
             width: 100%,
             height: 2.5cm,
             stroke: gridborder + 0.5pt,
           )
         } else { [] })
      }
    )

    // Day labels
    #v(0.1cm)
    #h(0.8cm)
    #grid(
      columns: (1fr,) * 7,
      align: center,
      ..("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun").map(d =>
        text(size: 8pt, fill: labelgray)[#d]
      )
    )
  ]
]

#v(0.3cm)

// Helper for table cells
#let hcell(content) = table.cell(fill: headerbg)[#text(fill: headertext, weight: "bold")[#content]]
#let acell(content) = table.cell(fill: altrow)[#content]

// Medication row content
#let med-cell = [#text(size: 7pt)[am]#tinycmark #text(size: 7pt)[pm]#tinycmark]

// Cardio row content
#let cardio-cell = [#cmark #inputline(0.4cm)#text(size: 6pt)[m]]

// Steps row content
#let steps-cell = inputline(0.9cm)

// Voice training row content
#let voice-cell = [#cmark #inputline(0.4cm)#text(size: 6pt)[m]]

// Hours input
#let hours-cell = [#inputline(0.5cm)#text(size: 6pt)[h]]

// Mood circles
#let mood-cell = [#moodcircle#moodcircle#moodcircle#moodcircle#moodcircle]

// Water checkboxes
#let water-cell = [#tinycmark#tinycmark#tinycmark#tinycmark#tinycmark#tinycmark#tinycmark#tinycmark]

// Skincare cell
#let skin-cell = [#text(size: 7pt)[am]#tinycmark #text(size: 7pt)[pm]#tinycmark]

// Breaks cell
#let breaks-cell = [#smallcmark#smallcmark#smallcmark#smallcmark#smallcmark]

// Calories cell
#let cal-cell = inputline(0.9cm)

// Protein cell
#let protein-cell = [#inputline(0.6cm)#text(size: 6pt)[g]]

// Habits Table
#align(center)[
  #set text(size: 9pt)
  #table(
    columns: (2cm, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: (left, center, center, center, center, center, center, center),
    inset: 6pt,
    stroke: gridline + 0.3pt,

    // Header
    hcell[Habit], hcell[Mon], hcell[Tue], hcell[Wed], hcell[Thu], hcell[Fri], hcell[Sat], hcell[Sun],

    // Medication
    acell[Medication], acell[#med-cell], acell[#med-cell], acell[#med-cell], acell[#med-cell], acell[#med-cell], acell[#med-cell], acell[#med-cell],

    // Cardio
    [Cardio], cardio-cell, cardio-cell, cardio-cell, cardio-cell, cardio-cell, cardio-cell, cardio-cell,

    // Steps
    acell[Steps], acell[#steps-cell], acell[#steps-cell], acell[#steps-cell], acell[#steps-cell], acell[#steps-cell], acell[#steps-cell], acell[#steps-cell],

    // Stretching
    [Stretching], cmark, cmark, cmark, cmark, cmark, cmark, cmark,

    // Voice Training
    acell[Voice Training], acell[#voice-cell], acell[#voice-cell], acell[#voice-cell], acell[#voice-cell], acell[#voice-cell], acell[#voice-cell], acell[#voice-cell],

    // Deep Work
    [Deep Work], hours-cell, hours-cell, hours-cell, hours-cell, hours-cell, hours-cell, hours-cell,

    // Journaling
    acell[Journaling], acell[#cmark], acell[#cmark], acell[#cmark], acell[#cmark], acell[#cmark], acell[#cmark], acell[#cmark],

    // Sleep
    [Sleep], hours-cell, hours-cell, hours-cell, hours-cell, hours-cell, hours-cell, hours-cell,

    // Mood
    acell[Mood], acell[#mood-cell], acell[#mood-cell], acell[#mood-cell], acell[#mood-cell], acell[#mood-cell], acell[#mood-cell], acell[#mood-cell],

    // Screen Time
    [Screen Time], hours-cell, hours-cell, hours-cell, hours-cell, hours-cell, hours-cell, hours-cell,

    // Water
    acell[Water], acell[#water-cell], acell[#water-cell], acell[#water-cell], acell[#water-cell], acell[#water-cell], acell[#water-cell], acell[#water-cell],

    // Skincare
    [Skincare], skin-cell, skin-cell, skin-cell, skin-cell, skin-cell, skin-cell, skin-cell,

    // Breaks
    acell[Breaks], acell[#breaks-cell], acell[#breaks-cell], acell[#breaks-cell], acell[#breaks-cell], acell[#breaks-cell], acell[#breaks-cell], acell[#breaks-cell],

    // Calories
    [Calories], cal-cell, cal-cell, cal-cell, cal-cell, cal-cell, cal-cell, cal-cell,

    // Protein
    acell[Protein], acell[#protein-cell], acell[#protein-cell], acell[#protein-cell], acell[#protein-cell], acell[#protein-cell], acell[#protein-cell], acell[#protein-cell],
  )
]

#v(0.2cm)

// Footer
#text(size: 8pt, fill: labelgray)[
  *Mood:* fill circles 1--5 (left to right) #h(1em) *Water:* 8 glasses/day
  #h(1fr)
  *Notes:* #inputline(5cm)
]
