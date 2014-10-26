library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Illusion of stucture in AR modeling"),
  sidebarPanel(
    p("try p = n = 100, or p = 10, n = 1000. Both cases the data are random, but the first case shows an illusion of strucutre."),
    numericInput("p", "p, dimension of data", 100, min = 1, max = 1000, step = 1),
    numericInput("n", "n, amount of data", 100, min = 1, max = 1000, step = 1),
    actionButton("goButton", "Go!")
    ),
  mainPanel(
    h2("Fitting Autoregressive models in high-dimension"),
    p("This shiny app investigates the effect of high-dimensional data on the fitting of autoregressive (AR) models."),
    p("We model the data in a matrix, X, with size n-by-p, where n is the number of dimensions in a single data point and p is the number of data points. By 'high-dimension', we are discribing a situation where n ~ p, or that the numbers of dimensions and data points are similar, as oppose to the setting of traditional statistics where p << n. "),
    p("To show the effect of 'high-dimension', we shall generate data as random white noise without actual temporal correlations in the data. But we will fit an AR model to the data anyways, and plot the eigenvalues of the fitted temporal evolution matrix. As you will see by changing the values of p and n, in the regime where p ~ n, the data will present an illusion of structure in the form of eigenvalues distributed in a circle in the complex plane."),
    plotOutput("spec"),
    h3("Dimension of data: "),
    verbatimTextOutput("p"),
    h3("Amount of data: "),
    verbatimTextOutput("n")
    )
))