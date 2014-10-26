library(shiny)
library(MASS)

shinyServer(
  function(input, output) {
    output$p <- renderPrint({input$p})
    output$n <- renderPrint({input$n})
    
    output$spec <- renderPlot({
      input$goButton
      isolate({
        n <- input$n
        p <- input$p
        x <- matrix(rnorm(p * n), nrow=p, ncol=n)
        x0 <- x[, 1:n - 1]
        x1 <- x[, 2:n]
        
        A = x1 %*% t(x0) %*% ginv(x0 %*% t(x0))
        E = eigen(A)$values
        
        plot(x=Re(E), y=Im(E), type="p", main="Eigenvalues of fitted AR model", xlab="Real", ylab="Imag", xlim=c(-2, 2), ylim=c(-2, 2))})
    })
  }
)