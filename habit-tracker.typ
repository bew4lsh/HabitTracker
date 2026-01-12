#set page(
  paper: "us-letter",
  flipped: true,
  margin: 0.4in,
  fill: rgb("#15141b"),
)

#set text(font: "Calibri", size: 9pt, fill: rgb("#edecee"))

// CottonRandyBaby color palette
#let base = rgb("#15141b")
#let surface0 = rgb("#231b40")
#let surface1 = rgb("#3d375e")
#let text-color = rgb("#edecee")
#let muted = rgb("#6d6d6d")
#let purple = rgb("#a277ff")
#let pink = rgb("#f694ff")

// Mapped colors for habit tracker
#let headerbg = surface0
#let headertext = pink
#let altrow = surface0.lighten(10%)
#let gridborder = surface1
#let gridline = surface1
#let labelgray = muted

// Checkbox commands
#let cmark = box(
  width: 0.28cm,
  height: 0.28cm,
  stroke: purple + 0.5pt,
  radius: 1pt,
)

#let smallcmark = box(
  width: 0.22cm,
  height: 0.22cm,
  stroke: purple + 0.5pt,
  radius: 0.5pt,
)

#let tinycmark = box(
  width: 0.18cm,
  height: 0.18cm,
  stroke: purple + 0.5pt,
  radius: 0.5pt,
)

#let moodcircle = box(
  width: 0.24cm,
  height: 0.24cm,
  stroke: pink + 0.5pt,
  radius: 50%,
)

#let inputline(width) = box(
  width: width,
  stroke: (bottom: gridborder + 0.4pt),
)

// Title
#align(center)[
  #text(size: 14pt, weight: "bold", fill: purple)[Weekly Habit Tracker]
  #h(3em)
  #text(size: 10pt)[Week of: #inputline(2.5cm)]
]

#v(0.3cm)

// Weight Graph
#align(center)[
  #box(width: 90%)[
    #text(size: 10pt, weight: "bold", fill: purple)[Weight]
    #h(0.3em)
    #text(size: 8pt, fill: labelgray)[(lbs)]
    #v(0.2cm)

    #let graph-height = 1.8cm
    #let y-label-width = 0.7cm
    #let tick-length = 0.1cm

    // Graph with Y-axis labels positioned correctly
    #block(width: 100%, height: graph-height, clip: false)[
      // Y-axis labels - positioned at each horizontal line
      #for i in range(6) {
        let y = (i / 5) * graph-height
        place(
          dx: 0pt,
          dy: y - 0.3em,
          align(right, box(width: y-label-width - 0.15cm)[#inputline(0.5cm)])
        )
      }

      // Graph box with offset for y-labels
      #place(dx: y-label-width, dy: 0pt)[
        #box(width: calc.min(100%, 100%) - y-label-width, height: graph-height)[
          // Outer border
          #place(line(start: (0%, 0%), end: (100%, 0%), stroke: gridborder + 0.5pt))
          #place(line(start: (0%, 100%), end: (100%, 100%), stroke: gridborder + 0.5pt))
          #place(line(start: (0%, 0%), end: (0%, 100%), stroke: gridborder + 0.5pt))
          #place(line(start: (100%, 0%), end: (100%, 100%), stroke: gridborder + 0.5pt))

          // Horizontal grid lines (4 inner lines for 5 rows)
          #for i in range(1, 5) {
            let y = (i / 5) * 100%
            place(line(start: (0%, y), end: (100%, y), stroke: gridline + 0.3pt))
            // Left tick marks
            place(line(start: (-tick-length, y), end: (0pt, y), stroke: gridborder + 0.5pt))
          }

          // Vertical grid lines (6 inner lines for 7 columns)
          #for i in range(1, 7) {
            let x = (i / 7) * 100%
            place(line(start: (x, 0%), end: (x, 100%), stroke: gridline + 0.3pt))
            // Bottom tick marks
            place(line(start: (x, 100%), end: (x, 100% + tick-length), stroke: gridborder + 0.5pt))
          }
        ]
      ]
    ]

    // Day labels
    #v(0.15cm)
    #h(y-label-width)
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
  #set text(size: 8pt)
  #table(
    columns: (1.8cm, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: (left + horizon, center + bottom, center + bottom, center + bottom, center + bottom, center + bottom, center + bottom, center + bottom),
    inset: 4pt,
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
#text(size: 8pt)[
  #text(fill: pink, weight: "bold")[Mood:] #text(fill: muted)[fill circles 1--5 (left to right)] #h(1em) #text(fill: purple, weight: "bold")[Water:] #text(fill: muted)[8 glasses/day]
  #h(1fr)
  #text(fill: pink, weight: "bold")[Notes:] #inputline(5cm)
]
