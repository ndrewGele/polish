fluidPage(

  fluidRow(
    'Using a server file allows for reactivity.',
    textInput(
      inputId = 'test_text',
      label = 'Enter Some Text',
      value = '',
      placeholder = 'Type here'
    )
  ),

  fluidRow(
    textOutput('test_text_output')
  )

)
